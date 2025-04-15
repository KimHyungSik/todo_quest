// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quest _$QuestFromJson(Map<String, dynamic> json) => _Quest(
      id: json['id'] as String,
      completion_criteria_days:
          (json['completion_criteria_days'] as num).toInt(),
      description: json['description'] as String,
      difficulty: (json['difficulty'] as num).toInt(),
      difficulty_label: json['difficulty_label'] as String,
      duration_days: (json['duration_days'] as num).toInt(),
      rewards: json['rewards'] as Map<String, dynamic>,
      short_description: json['short_description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
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
      'tags': instance.tags,
      'title': instance.title,
    };
