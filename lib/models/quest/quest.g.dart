// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quest _$QuestFromJson(Map<String, dynamic> json) => _Quest(
      id: json['id'] as String,
      completion_criteria_days:
          (json['completion_criteria_days'] as num?)?.toInt() ?? 1,
      description: json['description'] as String? ?? '',
      difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
      difficulty_label: json['difficulty_label'] as String? ?? '쉬움',
      duration_days: (json['duration_days'] as num?)?.toInt() ?? 7,
      rewards: json['rewards'] as Map<String, dynamic>,
      short_description: json['short_description'] as String? ?? '',
      title: json['title'] as String,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => QuestCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rewardTitle:
          RewardTitle.fromJson(json['rewardTitle'] as Map<String, dynamic>),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestToJson(_Quest instance) => <String, dynamic>{
      'id': instance.id,
      'completion_criteria_days': instance.completion_criteria_days,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'difficulty_label': instance.difficulty_label,
      'duration_days': instance.duration_days,
      'rewards': instance.rewards,
      'short_description': instance.short_description,
      'title': instance.title,
      'categories': instance.categories,
      'rewardTitle': instance.rewardTitle,
      'isCompleted': instance.isCompleted,
    };
