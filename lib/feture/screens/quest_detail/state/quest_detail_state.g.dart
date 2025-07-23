// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestDetailState _$QuestDetailStateFromJson(Map<String, dynamic> json) =>
    _QuestDetailState(
      currentQuest: json['currentQuest'] == null
          ? null
          : UserQuestInfo.fromJson(
              json['currentQuest'] as Map<String, dynamic>),
      completionHistory: (json['completionHistory'] as List<dynamic>?)
              ?.map((e) => UserQuestInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCompletions: (json['totalCompletions'] as num?)?.toInt() ?? 0,
      isLoading: json['isLoading'] as bool? ?? false,
      isUpdatingStatus: json['isUpdatingStatus'] as bool? ?? false,
      isLoadingHistory: json['isLoadingHistory'] as bool? ?? false,
      successMessage: json['successMessage'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$QuestDetailStateToJson(_QuestDetailState instance) =>
    <String, dynamic>{
      'currentQuest': instance.currentQuest,
      'completionHistory': instance.completionHistory,
      'totalCompletions': instance.totalCompletions,
      'isLoading': instance.isLoading,
      'isUpdatingStatus': instance.isUpdatingStatus,
      'isLoadingHistory': instance.isLoadingHistory,
      'successMessage': instance.successMessage,
      'errorMessage': instance.errorMessage,
    };
