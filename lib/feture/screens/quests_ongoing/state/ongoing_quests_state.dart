import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../models/user/user_quest/user_quest.dart';

part 'ongoing_quests_state.freezed.dart';
part 'ongoing_quests_state.g.dart';

@freezed
abstract class OngoingQuestsState with _$OngoingQuestsState {
  const OngoingQuestsState._();

  factory OngoingQuestsState({
    @Default([]) List<UserQuestInfo> activeQuests,
    @Default(false) bool isLoading,
    String? successMessage,
    String? errorMessage,
  }) = _OngoingQuestsState;

  factory OngoingQuestsState.fromJson(Map<String, dynamic> json) => 
      _$OngoingQuestsStateFromJson(json);
}