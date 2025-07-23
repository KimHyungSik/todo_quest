import '../models/user/user_quest/user_quest.dart';

/// Quest time calculation utility class
/// Handles quest timing logic, remaining time calculations, and automatic failure processing
class QuestTimeCalculator {
  
  /// Calculates the remaining time for a quest
  static QuestTimeInfo calculateQuestTime(UserQuestInfo userQuest) {
    final now = DateTime.now();
    final startTime = userQuest.userQuestCreatedAt ?? now;
    final durationDays = userQuest.durationDays;
    
    // Calculate end time based on start time + duration
    final endTime = startTime.add(Duration(days: durationDays));
    
    // Calculate elapsed time
    final elapsedTime = now.difference(startTime);
    
    // Calculate remaining time
    final remainingTime = endTime.difference(now);
    
    // Determine if quest has expired
    final isExpired = remainingTime.isNegative;
    
    // Calculate progress percentage
    final totalDuration = Duration(days: durationDays);
    final progressPercentage = isExpired 
        ? 1.0 
        : (elapsedTime.inMilliseconds / totalDuration.inMilliseconds).clamp(0.0, 1.0);
    
    return QuestTimeInfo(
      startTime: startTime,
      endTime: endTime,
      elapsedTime: elapsedTime,
      remainingTime: remainingTime,
      isExpired: isExpired,
      progressPercentage: progressPercentage,
      questStatus: _determineQuestStatus(userQuest, isExpired),
    );
  }
  
  /// Determines the current status of a quest based on time and existing status
  static QuestStatus _determineQuestStatus(UserQuestInfo userQuest, bool isExpired) {
    // If quest is already completed or cancelled, keep that status
    if (userQuest.isCompleted) return QuestStatus.completed;
    if (userQuest.userQuestStatus?.toLowerCase() == 'cancelled' || 
        userQuest.userQuestStatus?.toLowerCase() == 'deferred') {
      return QuestStatus.cancelled;
    }
    
    // If quest has expired and is still in progress, it should be failed
    if (isExpired && userQuest.isInProgress) {
      return QuestStatus.failed;
    }
    
    // If quest is in progress and not expired
    if (userQuest.isInProgress) return QuestStatus.inProgress;
    
    // Default to pending
    return QuestStatus.pending;
  }
  
  /// Formats remaining time as a human-readable string
  static String formatRemainingTime(Duration remainingTime) {
    if (remainingTime.isNegative) {
      final overdue = Duration(milliseconds: -remainingTime.inMilliseconds);
      return '기한 초과 ${formatDuration(overdue)}';
    }
    
    return '남은 시간: ${formatDuration(remainingTime)}';
  }
  
  /// Formats elapsed time as a human-readable string
  static String formatElapsedTime(Duration elapsedTime) {
    return '진행 시간: ${formatDuration(elapsedTime)}';
  }
  
  /// Formats duration into a readable string (e.g., "2일 3시간 45분")
  static String formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    
    List<String> parts = [];
    
    if (days > 0) parts.add('${days}일');
    if (hours > 0) parts.add('${hours}시간');
    if (minutes > 0) parts.add('${minutes}분');
    
    if (parts.isEmpty) {
      return '1분 미만';
    }
    
    return parts.join(' ');
  }
  
  /// Formats time as a short string for display in cards (e.g., "2일 3시간")
  static String formatTimeShort(Duration duration) {
    if (duration.isNegative) {
      return '기한 초과';
    }
    
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    
    if (days > 0) {
      return hours > 0 ? '${days}일 ${hours}시간' : '${days}일';
    } else if (hours > 0) {
      return '${hours}시간';
    } else {
      final minutes = duration.inMinutes % 60;
      return minutes > 0 ? '${minutes}분' : '1분 미만';
    }
  }
  
  /// Gets time status color based on remaining time percentage
  static TimeStatusColor getTimeStatusColor(double progressPercentage) {
    if (progressPercentage >= 1.0) {
      return TimeStatusColor.expired;
    } else if (progressPercentage >= 0.8) {
      return TimeStatusColor.urgent;
    } else if (progressPercentage >= 0.5) {
      return TimeStatusColor.warning;
    } else {
      return TimeStatusColor.normal;
    }
  }
  
  /// Checks if a quest should be automatically failed
  static bool shouldAutoFail(UserQuestInfo userQuest) {
    final timeInfo = calculateQuestTime(userQuest);
    return timeInfo.isExpired && 
           userQuest.isInProgress && 
           timeInfo.questStatus == QuestStatus.failed;
  }
  
  /// Gets all quests that should be automatically failed
  static List<UserQuestInfo> getQuestsToAutoFail(List<UserQuestInfo> quests) {
    return quests.where(shouldAutoFail).toList();
  }
  
  /// Calculates total time spent on all completed quests
  static Duration calculateTotalTimeSpent(List<UserQuestInfo> completedQuests) {
    Duration total = Duration.zero;
    
    for (final quest in completedQuests) {
      if (quest.isCompleted && 
          quest.userQuestCompletedAt != null &&
          quest.userQuestCreatedAt != null) {
        final questDuration = quest.userQuestCompletedAt!
            .difference(quest.userQuestCreatedAt!);
        total += questDuration;
      }
    }
    
    return total;
  }
  
  /// Calculates average completion time for completed quests
  static Duration calculateAverageCompletionTime(List<UserQuestInfo> completedQuests) {
    final validQuests = completedQuests.where((quest) => 
        quest.isCompleted && 
        quest.userQuestCompletedAt != null && 
        quest.userQuestCreatedAt != null).toList();
    
    if (validQuests.isEmpty) return Duration.zero;
    
    final totalTime = calculateTotalTimeSpent(validQuests);
    return Duration(milliseconds: totalTime.inMilliseconds ~/ validQuests.length);
  }
}

/// Data class containing quest time information
class QuestTimeInfo {
  final DateTime startTime;
  final DateTime endTime;
  final Duration elapsedTime;
  final Duration remainingTime;
  final bool isExpired;
  final double progressPercentage;
  final QuestStatus questStatus;
  
  const QuestTimeInfo({
    required this.startTime,
    required this.endTime,
    required this.elapsedTime,
    required this.remainingTime,
    required this.isExpired,
    required this.progressPercentage,
    required this.questStatus,
  });
  
  /// Gets formatted remaining time string
  String get formattedRemainingTime => 
      QuestTimeCalculator.formatRemainingTime(remainingTime);
  
  /// Gets formatted elapsed time string
  String get formattedElapsedTime => 
      QuestTimeCalculator.formatElapsedTime(elapsedTime);
  
  /// Gets short formatted remaining time for cards
  String get shortRemainingTime => 
      QuestTimeCalculator.formatTimeShort(remainingTime);
  
  /// Gets time status color
  TimeStatusColor get timeStatusColor => 
      QuestTimeCalculator.getTimeStatusColor(progressPercentage);
}

/// Enum for quest status based on time calculations
enum QuestStatus {
  pending,
  inProgress,
  completed,
  failed,
  cancelled,
}

/// Enum for time status colors
enum TimeStatusColor {
  normal,    // Green - plenty of time
  warning,   // Yellow - some time left
  urgent,    // Orange - running out of time
  expired,   // Red - time expired
}

/// Extension to get display strings for quest status
extension QuestStatusExtension on QuestStatus {
  String get displayName {
    switch (this) {
      case QuestStatus.pending:
        return '대기중';
      case QuestStatus.inProgress:
        return '진행중';
      case QuestStatus.completed:
        return '완료';
      case QuestStatus.failed:
        return '실패';
      case QuestStatus.cancelled:
        return '포기';
    }
  }
}