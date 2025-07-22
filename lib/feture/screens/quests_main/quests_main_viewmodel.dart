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

  Future<void> onClickRecommendedQuest(Quest quest) async {
    // 퀘스트 선택 시작 - 로딩 상태 설정
    state = state.copyWith(
      isSelectingQuest: true,
      successMessage: null,
      errorMessage: null,
    );
    
    try {
      final result = await _questRepository.selectQuest(quest.id.toString());
      
      if (result.success) {
        // 퀘스트 선택 성공
        state = state.copyWith(
          isSelectingQuest: false,
          successMessage: result.message,
        );
        
        // 퀘스트 목록 새로고침
        await refreshQuests();
        
        // 성공 메시지를 3초 후 자동 제거
        Future.delayed(const Duration(seconds: 3), () {
          state = state.copyWith(successMessage: null);
        });
      } else {
        // 퀘스트 선택 실패
        state = state.copyWith(
          isSelectingQuest: false,
          errorMessage: result.message,
        );
        
        // 에러 메시지를 5초 후 자동 제거
        Future.delayed(const Duration(seconds: 5), () {
          state = state.copyWith(errorMessage: null);
        });
      }
    } catch (e) {
      // 예외 발생
      state = state.copyWith(
        isSelectingQuest: false,
        errorMessage: '퀘스트 선택 중 오류가 발생했습니다: $e',
      );
      
      // 에러 메시지를 5초 후 자동 제거
      Future.delayed(const Duration(seconds: 5), () {
        state = state.copyWith(errorMessage: null);
      });
    }
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
