// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing_quests_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OngoingQuestsState _$OngoingQuestsStateFromJson(Map<String, dynamic> json) =>
    _OngoingQuestsState(
      activeQuests: (json['activeQuests'] as List<dynamic>?)
              ?.map((e) => UserQuestInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      successMessage: json['successMessage'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$OngoingQuestsStateToJson(_OngoingQuestsState instance) =>
    <String, dynamic>{
      'activeQuests': instance.activeQuests,
      'isLoading': instance.isLoading,
      'successMessage': instance.successMessage,
      'errorMessage': instance.errorMessage,
    };
