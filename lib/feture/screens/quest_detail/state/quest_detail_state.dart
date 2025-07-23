import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../models/user/user_quest/user_quest.dart';

part 'quest_detail_state.freezed.dart';
part 'quest_detail_state.g.dart';

@freezed
abstract class QuestDetailState with _$QuestDetailState {
  const QuestDetailState._();

  factory QuestDetailState({
    UserQuestInfo? currentQuest,
    @Default([]) List<UserQuestInfo> completionHistory,
    @Default(0) int totalCompletions,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdatingStatus,
    @Default(false) bool isLoadingHistory,
    String? successMessage,
    String? errorMessage,
  }) = _QuestDetailState;

  factory QuestDetailState.fromJson(Map<String, dynamic> json) => 
      _$QuestDetailStateFromJson(json);
}