// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserQuestInfo _$UserQuestInfoFromJson(Map<String, dynamic> json) =>
    _UserQuestInfo(
      questId: json['quest_id'] as String,
      questTitle: json['quest_title'] as String,
      questDescription: json['quest_description'] as String?,
      questShortDescription: json['quest_short_description'] as String?,
      difficulty: (json['difficulty'] as num?)?.toInt(),
      difficultyLabel: json['difficulty_label'] as String?,
      completionCriteriaDays:
          (json['completion_criteria_days'] as num?)?.toInt() ?? 1,
      durationDays: (json['duration_days'] as num?)?.toInt() ?? 7,
      rewardsExp: (json['rewards_exp'] as num?)?.toInt() ?? 0,
      rewardTitleName: json['reward_title_name'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      userQuestId: json['user_quest_id'] as String,
      userQuestStatus: json['user_quest_status'] as String?,
      userQuestCreatedAt: json['user_quest_created_at'] == null
          ? null
          : DateTime.parse(json['user_quest_created_at'] as String),
      userQuestCompletedAt: json['user_quest_completed_at'] == null
          ? null
          : DateTime.parse(json['user_quest_completed_at'] as String),
    );

Map<String, dynamic> _$UserQuestInfoToJson(_UserQuestInfo instance) =>
    <String, dynamic>{
      'quest_id': instance.questId,
      'quest_title': instance.questTitle,
      'quest_description': instance.questDescription,
      'quest_short_description': instance.questShortDescription,
      'difficulty': instance.difficulty,
      'difficulty_label': instance.difficultyLabel,
      'completion_criteria_days': instance.completionCriteriaDays,
      'duration_days': instance.durationDays,
      'rewards_exp': instance.rewardsExp,
      'reward_title_name': instance.rewardTitleName,
      'categories': instance.categories,
      'user_quest_id': instance.userQuestId,
      'user_quest_status': instance.userQuestStatus,
      'user_quest_created_at': instance.userQuestCreatedAt?.toIso8601String(),
      'user_quest_completed_at':
          instance.userQuestCompletedAt?.toIso8601String(),
    };
