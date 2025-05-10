// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardTitle _$RewardTitleFromJson(Map<String, dynamic> json) => _RewardTitle(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RewardTitleToJson(_RewardTitle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
