// QuestsMainViewModel
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_main/state/quests_main_state.dart';

import '../../../repositories/auth_repository/auth_repository.dart';
import '../../../repositories/quest_repository/quest_respository.dart';

class QuestsMainViewModel extends StateNotifier<QuestsMainState> {
  QuestsMainViewModel()
      : super(QuestsMainState()) {
    _initialize();
  }

  final QuestRepository _questRepository = QuestRepository();

  // 초기화
  Future<void> _initialize() async {
    final recommendedQuests = await _questRepository.getQuestRecommendations();
    state = state.copyWith(recommendedQuests: recommendedQuests);
  }
}

final questsMainViewModelProvider = StateNotifierProvider<QuestsMainViewModel, QuestsMainState>((ref) {
  return QuestsMainViewModel();
});