// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
      id: json['id'] as String,
      email: json['email'] as String,
      nickname: json['nickname'] as String?,
      profileImage: json['profile_image'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lastSignInAt: json['last_sign_in_at'] == null
          ? null
          : DateTime.parse(json['last_sign_in_at'] as String),
      emailConfirmedAt: json['email_confirmed_at'] == null
          ? null
          : DateTime.parse(json['email_confirmed_at'] as String),
    );

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
      'profile_image': instance.profileImage,
      'created_at': instance.createdAt?.toIso8601String(),
      'last_sign_in_at': instance.lastSignInAt?.toIso8601String(),
      'email_confirmed_at': instance.emailConfirmedAt?.toIso8601String(),
    };
