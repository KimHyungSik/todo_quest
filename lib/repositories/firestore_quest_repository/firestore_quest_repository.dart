import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/quest/quest.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 단일 챌린지 문서 가져오기
  Future<Quest?> getQuest(String id) async {
    try {
      final docSnapshot = await _firestore.collection('quests').doc(id).get();
      if (docSnapshot.exists) {
        return Quest.fromJson({
          'id': docSnapshot.id,
          ...docSnapshot.data()!,
        });
      }
      return null;
    } catch (e) {
      print('Error getting challenge: $e');
      rethrow;
    }
  }

  // 모든 퀘스트 가져오기
  Future<List<Quest>> getAllQuests() async {
    try {
      final querySnapshot = await _firestore.collection('quests').get();
      return querySnapshot.docs.map((doc) {
        return Quest.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      print('Error getting all quests: $e');
      rethrow;
    }
  }
}
