import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_quest/models/category/quest_category.dart';
import '../../models/quest/quest.dart';
import '../../models/title/reward_title.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Cache for quests to improve performance
  final Map<String, Quest> _questCache = {};
  final Map<String, RewardTitle> _titleCache = {};
  final Map<String, QuestCategory> _categoryCache = {};
  
  // Stream controllers for real-time updates
  final StreamController<List<Quest>> _questsStreamController = 
      StreamController<List<Quest>>.broadcast();
  
  Stream<List<Quest>> get questsStream => _questsStreamController.stream;
  
  FirestoreRepository() {
    // Listen for changes to the quests collection
    _setupQuestListener();
  }
  
  void _setupQuestListener() {
    _firestore.collection('quests').snapshots().listen((snapshot) {
      _updateQuestsFromSnapshot(snapshot);
    }, onError: (error) {
      print('Error in quest listener: $error');
      _questsStreamController.addError(error);
    });
  }
  
  void _updateQuestsFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) async {
    try {
      final quests = await _processQuestDocuments(snapshot.docs);
      _questsStreamController.add(quests);
    } catch (e) {
      print('Error updating quests from snapshot: $e');
      _questsStreamController.addError(e);
    }
  }

  // 단일 퀘스트 문서 가져오기
  Future<Quest?> getQuest(String id) async {
    // Check cache first
    if (_questCache.containsKey(id)) {
      return _questCache[id];
    }
    
    try {
      final docSnapshot = await _firestore.collection('quests').doc(id).get();
      if (!docSnapshot.exists) {
        return null;
      }
      
      final data = docSnapshot.data()!;
      final quest = await _processQuestDocument(docSnapshot.id, data);
      
      // Cache the result
      _questCache[id] = quest;
      return quest;
    } catch (e) {
      print('Error getting quest: $e');
      // Return a fallback quest object instead of throwing
      return Quest.safe(
        id: id,
        title: 'Error Loading Quest',
        rewardTitle: RewardTitle(
          id: 'error',
          name: 'Error',
          description: 'There was an error loading this quest',
        ),
      );
    }
  }

  // 모든 퀘스트 가져오기 (개선된 성능과 오류 처리)
  Future<List<Quest>> getAllQuests() async {
    try {
      // Use limit and ordering for better performance
      final querySnapshot = await _firestore
          .collection('quests')
          .orderBy('created_at', descending: true)
          .limit(50) // Limit to reasonable number for mobile
          .get();
      
      return await _processQuestDocuments(querySnapshot.docs);
    } catch (e) {
      print('Error getting all quests: $e');
      // Return empty list instead of throwing
      return [];
    }
  }
  
  // Process multiple quest documents efficiently
  Future<List<Quest>> _processQuestDocuments(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) async {
    try {
      // First collect all reference IDs to batch fetch
      final titleRefs = <String>{};
      final categoryRefs = <String>{};
      
      for (final doc in docs) {
        final data = doc.data();
        if (data.containsKey('rewards') && 
            data['rewards'] is Map && 
            data['rewards'].containsKey('title_ref')) {
          try {
            final titleRef = data['rewards']['title_ref'] as DocumentReference;
            titleRefs.add(titleRef.id);
          } catch (e) {
            print('Error extracting title reference: $e');
          }
        }
        
        if (data.containsKey('tag_refs') && data['tag_refs'] is List) {
          try {
            final tagRefs = data['tag_refs'] as List;
            for (final ref in tagRefs) {
              if (ref is DocumentReference) {
                categoryRefs.add(ref.id);
              }
            }
          } catch (e) {
            print('Error extracting category references: $e');
          }
        }
      }
      
      // Batch fetch all titles
      await _prefetchTitles(titleRefs.toList());
      
      // Batch fetch all categories
      await _prefetchCategories(categoryRefs.toList());
      
      // Now process each document with cached references
      final quests = <Quest>[];
      for (final doc in docs) {
        try {
          final data = doc.data();
          final quest = await _processQuestDocument(doc.id, data);
          quests.add(quest);
          // Update cache
          _questCache[doc.id] = quest;
        } catch (e) {
          print('Error processing quest document ${doc.id}: $e');
          // Add a placeholder quest instead of skipping
          quests.add(Quest.safe(
            id: doc.id,
            title: 'Error Loading Quest',
            rewardTitle: RewardTitle(
              id: 'error',
              name: 'Error',
              description: 'There was an error loading this quest',
            ),
          ));
        }
      }
      
      return quests;
    } catch (e) {
      print('Error in _processQuestDocuments: $e');
      return [];
    }
  }
  
  // Process a single quest document with error handling
  Future<Quest> _processQuestDocument(String docId, Map<String, dynamic> data) async {
    try {
      // Handle reward title reference
      RewardTitle? questTitle;
      if (data.containsKey('rewards') && 
          data['rewards'] is Map && 
          data['rewards'].containsKey('title_ref')) {
        try {
          final titleRef = data['rewards']['title_ref'] as DocumentReference;
          questTitle = await _getRewardTitle(titleRef.id);
        } catch (e) {
          print('Error processing title reference: $e');
          questTitle = RewardTitle(
            id: 'unknown',
            name: 'Unknown Title',
            description: '',
          );
        }
      } else {
        // Default title if missing
        questTitle = RewardTitle(
          id: 'default',
          name: 'Quest Title',
          description: '',
        );
      }
      
      // Handle category references
      List<QuestCategory> categories = [];
      if (data.containsKey('tag_refs') && data['tag_refs'] is List) {
        try {
          final tagRefs = data['tag_refs'] as List;
          for (final ref in tagRefs) {
            if (ref is DocumentReference) {
              final category = await _getQuestCategory(ref.id);
              if (category != null) {
                categories.add(category);
              }
            }
          }
        } catch (e) {
          print('Error processing category references: $e');
        }
      }
      
      // Create Quest object with transformed data
      final questData = {
        'id': docId,
        ...data,
        'rewardTitle': questTitle.toJson(),
        'categories': categories.map((c) => c.toJson()).toList(),
      };
      
      // Use the safe fromJson method
      return Quest.fromJsonSafe(questData);
    } catch (e) {
      print('Error in _processQuestDocument: $e');
      // Return a fallback Quest instead of throwing
      return Quest.safe(
        id: docId,
        title: data['title'] as String? ?? 'Unknown Quest',
        rewardTitle: RewardTitle(
          id: 'error',
          name: 'Error Title',
          description: '',
        ),
      );
    }
  }
  
  // Prefetch titles for better performance
  Future<void> _prefetchTitles(List<String> titleIds) async {
    try {
      if (titleIds.isEmpty) return;
      
      // Find which IDs are not already cached
      final uncachedIds = titleIds.where((id) => !_titleCache.containsKey(id)).toList();
      if (uncachedIds.isEmpty) return;
      
      // Batch fetch uncached titles
      final chunks = _chunkList(uncachedIds, 10); // Firestore limits to 10 in batches
      
      for (final chunk in chunks) {
        try {
          final batch = _firestore.batch();
          final docs = chunk.map((id) => _firestore.collection('titles').doc(id)).toList();
          
          final snapshots = await Future.wait(docs.map((doc) => doc.get()));
          
          for (final snapshot in snapshots) {
            if (snapshot.exists) {
              final data = snapshot.data()!;
              _titleCache[snapshot.id] = RewardTitle.fromJson({
                'id': snapshot.id,
                ...data,
              });
            }
          }
        } catch (e) {
          print('Error in title batch fetch: $e');
        }
      }
    } catch (e) {
      print('Error prefetching titles: $e');
    }
  }
  
  // Prefetch categories for better performance
  Future<void> _prefetchCategories(List<String> categoryIds) async {
    try {
      if (categoryIds.isEmpty) return;
      
      // Find which IDs are not already cached
      final uncachedIds = categoryIds.where((id) => !_categoryCache.containsKey(id)).toList();
      if (uncachedIds.isEmpty) return;
      
      // Batch fetch uncached categories
      final chunks = _chunkList(uncachedIds, 10); // Firestore limits to 10 in batches
      
      for (final chunk in chunks) {
        try {
          final batch = _firestore.batch();
          final docs = chunk.map((id) => _firestore.collection('categories').doc(id)).toList();
          
          final snapshots = await Future.wait(docs.map((doc) => doc.get()));
          
          for (final snapshot in snapshots) {
            if (snapshot.exists) {
              final data = snapshot.data()!;
              _categoryCache[snapshot.id] = QuestCategory.fromJson({
                'id': snapshot.id,
                ...data,
              });
            }
          }
        } catch (e) {
          print('Error in category batch fetch: $e');
        }
      }
    } catch (e) {
      print('Error prefetching categories: $e');
    }
  }
  
  // Helper to get a reward title with caching
  Future<RewardTitle> _getRewardTitle(String id) async {
    if (_titleCache.containsKey(id)) {
      return _titleCache[id]!;
    }
    
    try {
      final doc = await _firestore.collection('titles').doc(id).get();
      if (doc.exists) {
        final title = RewardTitle.fromJson({
          'id': doc.id,
          ...doc.data()!,
        });
        _titleCache[id] = title;
        return title;
      }
    } catch (e) {
      print('Error fetching reward title: $e');
    }
    
    // Return fallback
    return RewardTitle(
      id: id,
      name: 'Unknown Title',
      description: '',
    );
  }
  
  // Helper to get a quest category with caching
  Future<QuestCategory?> _getQuestCategory(String id) async {
    if (_categoryCache.containsKey(id)) {
      return _categoryCache[id]!;
    }
    
    try {
      final doc = await _firestore.collection('categories').doc(id).get();
      if (doc.exists) {
        final category = QuestCategory.fromJson({
          'id': doc.id,
          ...doc.data()!,
        });
        _categoryCache[id] = category;
        return category;
      }
    } catch (e) {
      print('Error fetching quest category: $e');
    }
    
    // Return fallback
    return QuestCategory(
      id: id,
      name: 'Unknown Category',
      description: '',
    );
  }
  
  // Helper function to chunk a list for batch operations
  List<List<T>> _chunkList<T>(List<T> list, int chunkSize) {
    final chunks = <List<T>>[];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
        i, 
        i + chunkSize < list.length ? i + chunkSize : list.length
      ));
    }
    return chunks;
  }
  
  // Clean up resources when done
  void dispose() {
    _questsStreamController.close();
  }
  
  // Clear caches (useful after sign out)
  void clearCaches() {
    _questCache.clear();
    _titleCache.clear();
    _categoryCache.clear();
  }
}
