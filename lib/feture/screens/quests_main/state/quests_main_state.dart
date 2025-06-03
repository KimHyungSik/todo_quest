import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../models/quest/quest.dart';

part 'quests_main_state.freezed.dart';
part 'quests_main_state.g.dart';

@freezed
abstract class QuestsMainState with _$QuestsMainState{
  const QuestsMainState._();

  factory QuestsMainState({
    @Default([]) List<Quest> recommendedQuests,
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
  }) = _QuestsMainState;

  factory QuestsMainState.fromJson(Map<String, dynamic> json) => _$QuestsMainStateFromJson(json);
}