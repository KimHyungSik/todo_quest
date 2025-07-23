import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user/user_quest/user_quest.dart';
import '../repositories/user_repository/user_quest_repository.dart';
import '../utils/quest_time_calculator.dart';

/// Service that manages quest timers and automatic failure processing
class QuestTimerService extends StateNotifier<QuestTimerState> {
  QuestTimerService() : super(QuestTimerState()) {
    _initialize();
  }
  
  final UserQuestRepository _userQuestRepository = 
      UserQuestRepository(Supabase.instance.client);
  
  Timer? _periodicTimer;
  
  /// Initialize the timer service
  void _initialize() {
    _startPeriodicCheck();
  }
  
  /// Start periodic checking for expired quests
  void _startPeriodicCheck() {
    // Check every 5 minutes for expired quests
    _periodicTimer = Timer.periodic(
      const Duration(minutes: 5), 
      (_) => checkAndProcessExpiredQuests(),
    );
    
    // Also check immediately
    checkAndProcessExpiredQuests();
  }
  
  /// Check for expired quests and process them as failures
  Future<void> checkAndProcessExpiredQuests() async {
    try {
      state = state.copyWith(isProcessing: true);
      
      // Get all active quests
      final activeQuests = await _userQuestRepository.getActiveQuests();
      
      // Find quests that should be automatically failed
      final questsToFail = QuestTimeCalculator.getQuestsToAutoFail(activeQuests);
      
      if (questsToFail.isNotEmpty) {
        print('발견된 만료 퀘스트: ${questsToFail.length}개');
        
        // Process each expired quest
        final failedQuests = <UserQuestInfo>[];
        for (final quest in questsToFail) {
          try {
            final success = await _failQuest(quest);
            if (success) {
              failedQuests.add(quest);
            }
          } catch (e) {
            print('퀘스트 실패 처리 중 오류: ${quest.questTitle} - $e');
          }
        }
        
        state = state.copyWith(
          lastProcessedCount: failedQuests.length,
          lastProcessedAt: DateTime.now(),
          isProcessing: false,
        );
        
        if (failedQuests.isNotEmpty) {
          // Notify about failed quests
          _notifyQuestsAutoFailed(failedQuests);
        }
      } else {
        state = state.copyWith(
          lastProcessedCount: 0,
          lastProcessedAt: DateTime.now(),
          isProcessing: false,
        );
      }
    } catch (e) {
      print('만료 퀘스트 확인 중 오류 발생: $e');
      state = state.copyWith(
        isProcessing: false,
        lastError: e.toString(),
      );
    }
  }
  
  /// Fail a specific quest
  Future<bool> _failQuest(UserQuestInfo quest) async {
    try {
      // TODO: Implement actual API call to fail the quest
      // For now, this is a placeholder
      print('퀘스트 자동 실패 처리: ${quest.questTitle}');
      
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      // In a real implementation, you would call something like:
      // await _userQuestRepository.failQuest(quest.userQuestId);
      
      return true;
    } catch (e) {
      print('퀘스트 실패 처리 실패: ${quest.questTitle} - $e');
      return false;
    }
  }
  
  /// Notify about automatically failed quests
  void _notifyQuestsAutoFailed(List<UserQuestInfo> failedQuests) {
    // TODO: Implement notification system
    // This could trigger push notifications, in-app notifications, etc.
    print('자동 실패 처리된 퀘스트들:');
    for (final quest in failedQuests) {
      print('- ${quest.questTitle}');
    }
  }
  
  /// Get time info for a specific quest
  QuestTimeInfo getQuestTimeInfo(UserQuestInfo quest) {
    return QuestTimeCalculator.calculateQuestTime(quest);
  }
  
  /// Get time info for multiple quests
  Map<String, QuestTimeInfo> getQuestTimeInfoMap(List<UserQuestInfo> quests) {
    final Map<String, QuestTimeInfo> timeInfoMap = {};
    
    for (final quest in quests) {
      timeInfoMap[quest.userQuestId] = getQuestTimeInfo(quest);
    }
    
    return timeInfoMap;
  }
  
  /// Check if a specific quest is expired
  bool isQuestExpired(UserQuestInfo quest) {
    return QuestTimeCalculator.shouldAutoFail(quest);
  }
  
  /// Get summary statistics about quest times
  QuestTimeStats getQuestTimeStats(List<UserQuestInfo> allQuests) {
    final activeQuests = allQuests.where((q) => q.isInProgress).toList();
    final completedQuests = allQuests.where((q) => q.isCompleted).toList();
    final expiredQuests = allQuests.where(QuestTimeCalculator.shouldAutoFail).toList();
    
    final totalTimeSpent = QuestTimeCalculator.calculateTotalTimeSpent(completedQuests);
    final averageCompletionTime = QuestTimeCalculator.calculateAverageCompletionTime(completedQuests);
    
    return QuestTimeStats(
      activeQuestsCount: activeQuests.length,
      completedQuestsCount: completedQuests.length,
      expiredQuestsCount: expiredQuests.length,
      totalTimeSpent: totalTimeSpent,
      averageCompletionTime: averageCompletionTime,
    );
  }
  
  /// Manually trigger expired quest check
  Future<void> forceCheckExpiredQuests() async {
    await checkAndProcessExpiredQuests();
  }
  
  @override
  void dispose() {
    _periodicTimer?.cancel();
    super.dispose();
  }
}

/// State for the quest timer service
class QuestTimerState {
  final bool isProcessing;
  final int lastProcessedCount;
  final DateTime? lastProcessedAt;
  final String? lastError;
  
  const QuestTimerState({
    this.isProcessing = false,
    this.lastProcessedCount = 0,
    this.lastProcessedAt,
    this.lastError,
  });
  
  QuestTimerState copyWith({
    bool? isProcessing,
    int? lastProcessedCount,
    DateTime? lastProcessedAt,
    String? lastError,
  }) {
    return QuestTimerState(
      isProcessing: isProcessing ?? this.isProcessing,
      lastProcessedCount: lastProcessedCount ?? this.lastProcessedCount,
      lastProcessedAt: lastProcessedAt ?? this.lastProcessedAt,
      lastError: lastError ?? this.lastError,
    );
  }
}

/// Statistics about quest times
class QuestTimeStats {
  final int activeQuestsCount;
  final int completedQuestsCount;
  final int expiredQuestsCount;
  final Duration totalTimeSpent;
  final Duration averageCompletionTime;
  
  const QuestTimeStats({
    required this.activeQuestsCount,
    required this.completedQuestsCount,
    required this.expiredQuestsCount,
    required this.totalTimeSpent,
    required this.averageCompletionTime,
  });
}

/// Provider for the quest timer service
final questTimerServiceProvider = 
    StateNotifierProvider<QuestTimerService, QuestTimerState>((ref) {
  return QuestTimerService();
});