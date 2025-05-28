// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quest _$QuestFromJson(Map<String, dynamic> json) => _Quest(
      id: json['id'] as String,
      title: json['title'] as String,
      rewardTitleUUid: json['rewards_title'] as String,
      rewardsExp: (json['rewards_exp'] as num).toInt(),
      difficulty: (json['difficulty'] as num).toInt(),
      difficultyLabel: json['difficulty_label'] as String?,
      completion_criteria_days:
          (json['completion_criteria_days'] as num).toInt(),
      durationDays: (json['duration_days'] as num).toInt(),
      description: json['description'] as String?,
      shortDescription: json['short_description'] as String?,
    );

Map<String, dynamic> _$QuestToJson(_Quest instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rewards_title': instance.rewardTitleUUid,
      'rewards_exp': instance.rewardsExp,
      'difficulty': instance.difficulty,
      'difficulty_label': instance.difficultyLabel,
      'completion_criteria_days': instance.completion_criteria_days,
      'duration_days': instance.durationDays,
      'description': instance.description,
      'short_description': instance.shortDescription,
    };
