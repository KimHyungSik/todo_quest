import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/feture/screens/quests_ongoing/state/ongoing_quests_state.dart';
import 'package:todo_quest/repositories/user_repository/user_quest_repository.dart';
import '../../../models/user/user_quest/user_quest.dart';

class OngoingQuestsViewModel extends StateNotifier<OngoingQuestsState> {
  OngoingQuestsViewModel() : super(OngoingQuestsState()) {
    _initialize();
  }

  final UserQuestRepository _userQuestRepository = UserQuestRepository(Supabase.instance.client);

  // 초기화
  Future<void> _initialize() async {
    state = state.copyWith(isLoading: true);
    
    final activeQuests = await _loadActiveQuests();
    
    state = state.copyWith(
      activeQuests: activeQuests,
      isLoading: false,
    );
  }

  // 활성 퀘스트 로드
  Future<List<UserQuestInfo>> _loadActiveQuests() async {
    try {
      return await _userQuestRepository.getActiveQuests();
    } catch (e) {
      print('활성 퀘스트 로드 중 오류 발생: $e');
      state = state.copyWith(
        errorMessage: '퀘스트를 불러오는 중 오류가 발생했습니다',
      );
      return [];
    }
  }

  // 퀘스트 새로고침
  Future<void> refreshQuests() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    final activeQuests = await _loadActiveQuests();
    
    state = state.copyWith(
      activeQuests: activeQuests,
      isLoading: false,
    );
  }

  // 활성 퀘스트 클릭 처리
  void onClickActiveQuest(UserQuestInfo userQuest) {
    print("활성 퀘스트 클릭: ${userQuest.questTitle}");
    // TODO: 퀘스트 상세 화면으로 이동 또는 퀘스트 관리 기능 추가
    
    // 임시 성공 메시지 표시
    state = state.copyWith(
      successMessage: '퀘스트 "${userQuest.questTitle}"을 선택했습니다',
    );
    
    // 3초 후 메시지 제거
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        state = state.copyWith(successMessage: null);
      }
    });
  }

  // 에러 메시지 제거
  void clearErrorMessage() {
    state = state.copyWith(errorMessage: null);
  }

  // 성공 메시지 제거
  void clearSuccessMessage() {
    state = state.copyWith(successMessage: null);
  }
}

final ongoingQuestsViewModelProvider =
    StateNotifierProvider<OngoingQuestsViewModel, OngoingQuestsState>((ref) {
  return OngoingQuestsViewModel();
});