// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_quests_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendedQuestsState _$RecommendedQuestsStateFromJson(
        Map<String, dynamic> json) =>
    _RecommendedQuestsState(
      recommendedQuests: (json['recommendedQuests'] as List<dynamic>?)
              ?.map((e) => Quest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => QuestCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedCategory: json['selectedCategory'] == null
          ? null
          : QuestCategory.fromJson(
              json['selectedCategory'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      isSelectingQuest: json['isSelectingQuest'] as bool? ?? false,
      successMessage: json['successMessage'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$RecommendedQuestsStateToJson(
        _RecommendedQuestsState instance) =>
    <String, dynamic>{
      'recommendedQuests': instance.recommendedQuests,
      'categories': instance.categories,
      'selectedCategory': instance.selectedCategory,
      'isLoading': instance.isLoading,
      'isSelectingQuest': instance.isSelectingQuest,
      'successMessage': instance.successMessage,
      'errorMessage': instance.errorMessage,
    };
