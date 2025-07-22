// QuestsMainViewModel
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_main/state/quests_main_state.dart';

import '../../../models/quest/quest.dart';
import '../../../models/quest/category/quest_category.dart';
import '../../../repositories/quest_repository/quest_respository.dart';

class QuestsMainViewModel extends StateNotifier<QuestsMainState> {
  QuestsMainViewModel() : super(QuestsMainState()) {
    _initialize();
  }

  final QuestRepository _questRepository = QuestRepository();

  // 초기화
  Future<void> _initialize() async {
    state = state.copyWith(isLoading: true);
    
    final questsFuture = _questRepository.getQuestRecommendations();
    
    final recommendedQuests = await questsFuture;
    
    state = state.copyWith(
      recommendedQuests: recommendedQuests,
      isLoading: false,
    );
  }

  void onClickRecommendedQuest(Quest quest) {
    print("LOGEE $quest");
  }

  // 카테고리 선택
  Future<void> selectCategory(QuestCategory? category) async {
    if (state.selectedCategory == category) return;
    
    state = state.copyWith(
      selectedCategory: category,
      isLoading: true,
    );
    
    // 선택된 카테고리에 따라 퀘스트 로드
    final quests = await _questRepository.getQuestRecommendations(
      categoryId: category?.id.toString(),
    );
    
    state = state.copyWith(
      recommendedQuests: quests,
      isLoading: false,
    );
  }

  // 퀘스트 새로고침
  Future<void> refreshQuests() async {
    state = state.copyWith(isRefreshing: true);
    
    final quests = await _questRepository.getQuestRecommendations(
      categoryId: state.selectedCategory?.id.toString(),
    );
    
    state = state.copyWith(
      recommendedQuests: quests,
      isRefreshing: false,
    );
  }
}

final questsMainViewModelProvider =
    StateNotifierProvider<QuestsMainViewModel, QuestsMainState>((ref) {
  return QuestsMainViewModel();
});
