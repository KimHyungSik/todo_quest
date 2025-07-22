import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../models/quest/quest.dart';
import '../../../../models/quest/category/quest_category.dart';

part 'recommended_quests_state.freezed.dart';
part 'recommended_quests_state.g.dart';

@freezed
abstract class RecommendedQuestsState with _$RecommendedQuestsState {
  const RecommendedQuestsState._();

  factory RecommendedQuestsState({
    @Default([]) List<Quest> recommendedQuests,
    @Default([]) List<QuestCategory> categories,
    QuestCategory? selectedCategory,
    @Default(false) bool isLoading,
    @Default(false) bool isSelectingQuest,
    String? successMessage,
    String? errorMessage,
  }) = _RecommendedQuestsState;

  factory RecommendedQuestsState.fromJson(Map<String, dynamic> json) => 
      _$RecommendedQuestsStateFromJson(json);
}