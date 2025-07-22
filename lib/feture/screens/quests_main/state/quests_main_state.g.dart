// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quests_main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestsMainState _$QuestsMainStateFromJson(Map<String, dynamic> json) =>
    _QuestsMainState(
      recommendedQuests: (json['recommendedQuests'] as List<dynamic>?)
              ?.map((e) => Quest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activeQuests: (json['activeQuests'] as List<dynamic>?)
              ?.map((e) => UserQuestInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedCategory: json['selectedCategory'] == null
          ? null
          : QuestCategory.fromJson(
              json['selectedCategory'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      isRefreshing: json['isRefreshing'] as bool? ?? false,
      isSelectingQuest: json['isSelectingQuest'] as bool? ?? false,
      isLoadingActiveQuests: json['isLoadingActiveQuests'] as bool? ?? false,
      successMessage: json['successMessage'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$QuestsMainStateToJson(_QuestsMainState instance) =>
    <String, dynamic>{
      'recommendedQuests': instance.recommendedQuests,
      'activeQuests': instance.activeQuests,
      'selectedCategory': instance.selectedCategory,
      'isLoading': instance.isLoading,
      'isRefreshing': instance.isRefreshing,
      'isSelectingQuest': instance.isSelectingQuest,
      'isLoadingActiveQuests': instance.isLoadingActiveQuests,
      'successMessage': instance.successMessage,
      'errorMessage': instance.errorMessage,
    };
