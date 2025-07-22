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
      selectedCategory: json['selectedCategory'] == null
          ? null
          : QuestCategory.fromJson(
              json['selectedCategory'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      isRefreshing: json['isRefreshing'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestsMainStateToJson(_QuestsMainState instance) =>
    <String, dynamic>{
      'recommendedQuests': instance.recommendedQuests,
      'selectedCategory': instance.selectedCategory,
      'isLoading': instance.isLoading,
      'isRefreshing': instance.isRefreshing,
    };
