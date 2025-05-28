// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTitleInfo _$UserTitleInfoFromJson(Map<String, dynamic> json) =>
    _UserTitleInfo(
      userTitleId: json['user_title_id'] as String,
      titleId: json['title_id'] as String,
      titleName: json['title_name'] as String,
      titleDescription: json['title_description'] as String?,
      acquiredAt: json['acquired_at'] == null
          ? null
          : DateTime.parse(json['acquired_at'] as String),
    );

Map<String, dynamic> _$UserTitleInfoToJson(_UserTitleInfo instance) =>
    <String, dynamic>{
      'user_title_id': instance.userTitleId,
      'title_id': instance.titleId,
      'title_name': instance.titleName,
      'title_description': instance.titleDescription,
      'acquired_at': instance.acquiredAt?.toIso8601String(),
    };
