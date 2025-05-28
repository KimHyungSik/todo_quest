// ============================================================================
// User Quest Model (get_user_quests 함수 결과)
// ============================================================================
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_quest.freezed.dart';
part 'user_quest.g.dart';

@freezed
abstract class UserQuestInfo with _$UserQuestInfo {
  const UserQuestInfo._();

  factory UserQuestInfo({
    @JsonKey(name: 'quest_id') required String questId,
    @JsonKey(name: 'quest_title') required String questTitle,
    @JsonKey(name: 'quest_description') String? questDescription,
    @JsonKey(name: 'quest_short_description') String? questShortDescription,
    int? difficulty, // smallint에서 int로 변경
    @JsonKey(name: 'difficulty_label') String? difficultyLabel,
    @JsonKey(name: 'completion_criteria_days') @Default(1) int completionCriteriaDays,
    @JsonKey(name: 'duration_days') @Default(7) int durationDays,
    @JsonKey(name: 'rewards_exp') @Default(0) int rewardsExp,
    @JsonKey(name: 'reward_title_name') String? rewardTitleName,
    @Default([]) List<String> categories,
    @JsonKey(name: 'user_quest_id') required String userQuestId,
    @JsonKey(name: 'user_quest_status') String? userQuestStatus,
    @JsonKey(name: 'user_quest_created_at') DateTime? userQuestCreatedAt,
    @JsonKey(name: 'user_quest_completed_at') DateTime? userQuestCompletedAt,
  }) = _UserQuestInfo;

  factory UserQuestInfo.fromJson(Map<String, dynamic> json) => _$UserQuestInfoFromJson(json);

  // Helper methods for status
  bool get isCompleted => userQuestStatus == 'completed';
  bool get isInProgress => userQuestStatus == 'in_progress';
  bool get isPending => userQuestStatus == 'pending';
  bool get isDeferred => userQuestStatus == 'deferred';
  bool get isCancelled => userQuestStatus == 'cancelled';

  // Helper methods for difficulty
  String get difficultyDisplayLabel => difficultyLabel ?? 'Normal';
  bool get isEasy => difficulty == 1;
  bool get isNormal => difficulty == 2;
  bool get isHard => difficulty == 3;

  // Helper methods for time calculations
  Duration? get timeSinceCreated => userQuestCreatedAt != null
      ? DateTime.now().difference(userQuestCreatedAt!)
      : null;

  Duration? get timeSinceCompleted => userQuestCompletedAt != null
      ? DateTime.now().difference(userQuestCompletedAt!)
      : null;

  // 퀘스트 마감일 계산 (생성일 + duration_days)
  DateTime? get deadline => userQuestCreatedAt != null
      ? userQuestCreatedAt!.add(Duration(days: durationDays))
      : null;

  // 남은 시간
  Duration? get timeRemaining {
    final dl = deadline;
    if (dl == null || isCompleted) return null;
    final remaining = dl.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  // 마감 임박 여부 (1일 이하 남음)
  bool get isDeadlineApproaching {
    final remaining = timeRemaining;
    return remaining != null && remaining.inHours <= 24;
  }

  // 마감 초과 여부
  bool get isOverdue {
    final remaining = timeRemaining;
    return remaining != null && remaining == Duration.zero && !isCompleted;
  }

  // 카테고리 문자열 (쉼표로 구분)
  String get categoriesString => categories.join(', ');

  // 보상 여부 확인
  bool get hasReward => rewardsExp > 0 || (rewardTitleName?.isNotEmpty ?? false);
}