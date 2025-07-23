// QuestsMainViewModel
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/feture/screens/quests_main/state/quests_main_state.dart';
import 'package:todo_quest/repositories/user_repository/user_quest_repository.dart';
import 'package:todo_quest/feture/screens/quest_detail/quest_detail_screen.dart';

import '../../../models/quest/quest.dart';
import '../../../models/quest/category/quest_category.dart';
import '../../../models/user/user_quest/user_quest.dart';
import '../../../repositories/quest_repository/quest_respository.dart';
import '../../../repositories/user_repository/user_repository.dart';

class QuestsMainViewModel extends StateNotifier<QuestsMainState> {
  QuestsMainViewModel() : super(QuestsMainState()) {
    _initialize();
  }

  final QuestRepository _questRepository = QuestRepository();
  final UserRepository _userRepository = UserRepository(Supabase.instance.client);
  final UserQuestRepository _userQuestRepository = UserQuestRepository(Supabase.instance.client);

  // 초기화
  Future<void> _initialize() async {
    state = state.copyWith(isLoading: true);
    
    // 추천 퀘스트와 활성 퀘스트를 병렬로 로드
    final recommendedQuestsFuture = _questRepository.getQuestRecommendations();
    final activeQuestsFuture = _loadActiveQuests();

    final recommendedQuests = await recommendedQuestsFuture;
    final activeQuests = await activeQuestsFuture;

    state = state.copyWith(
      recommendedQuests: recommendedQuests,
      activeQuests: activeQuests,
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
        await refreshActiveQuests();
        
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

  // 활성 퀘스트 로드
  Future<List<UserQuestInfo>> _loadActiveQuests() async {
    try {
      return await _userQuestRepository.getActiveQuests();
    } catch (e) {
      print('활성 퀘스트 로드 중 오류 발생: $e');
      return [];
    }
  }

  // 활성 퀘스트 새로고침
  Future<void> refreshActiveQuests() async {
    state = state.copyWith(isLoadingActiveQuests: true);
    
    final activeQuests = await _loadActiveQuests();
    
    state = state.copyWith(
      activeQuests: activeQuests,
      isLoadingActiveQuests: false,
    );
  }

  // 활성 퀘스트 클릭 처리
  void onClickActiveQuest(UserQuestInfo userQuest, BuildContext context) {
    print("활성 퀘스트 클릭: ${userQuest.questTitle}");
    
    // 퀘스트 상세 화면으로 이동
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuestDetailScreen(
          userQuestId: userQuest.userQuestId,
          questTitle: userQuest.questTitle,
        ),
      ),
    );
  }
}

final questsMainViewModelProvider =
    StateNotifierProvider<QuestsMainViewModel, QuestsMainState>((ref) {
  return QuestsMainViewModel();
});
