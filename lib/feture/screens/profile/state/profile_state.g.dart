// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileState _$ProfileStateFromJson(Map<String, dynamic> json) =>
    _ProfileState(
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      allCategories: (json['allCategories'] as List<dynamic>?)
              ?.map((e) => QuestCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedCategories: (json['selectedCategories'] as List<dynamic>?)
              ?.map((e) => QuestCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      isSaving: json['isSaving'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ProfileStateToJson(_ProfileState instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
      'allCategories': instance.allCategories,
      'selectedCategories': instance.selectedCategories,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
      'errorMessage': instance.errorMessage,
    };
