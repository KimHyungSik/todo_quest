// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestCategory _$QuestCategoryFromJson(Map<String, dynamic> json) =>
    _QuestCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$QuestCategoryToJson(_QuestCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
