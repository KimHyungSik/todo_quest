import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/feture/screens/quest_detail/state/quest_detail_state.dart';
import 'package:todo_quest/repositories/user_repository/user_quest_repository.dart';

class QuestDetailViewModel extends StateNotifier<QuestDetailState> {
  QuestDetailViewModel(this._userQuestId) : super(QuestDetailState()) {
    _initialize();
  }

  final String _userQuestId;
  final UserQuestRepository _userQuestRepository = UserQuestRepository(Supabase.instance.client);

  // 초기화
  Future<void> _initialize() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      // Load current quest details
      await _loadQuestDetails();
      // Load completion history after quest details
      await _loadCompletionHistory();
      
      state = state.copyWith(isLoading: false);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '퀘스트 정보를 불러오는 중 오류가 발생했습니다: $error',
      );
    }
  }

  // 퀘스트 상세 정보 로드
  Future<void> _loadQuestDetails() async {
    try {
      final allQuests = await _userQuestRepository.getAllQuests();
      final currentQuest = allQuests.firstWhere(
        (quest) => quest.userQuestId == _userQuestId,
        orElse: () => throw Exception('퀘스트를 찾을 수 없습니다'),
      );
      
      state = state.copyWith(currentQuest: currentQuest);
    } catch (error) {
      throw Exception('퀘스트 상세 정보 로드 실패: $error');
    }
  }

  // 완료 이력 로드
  Future<void> _loadCompletionHistory() async {
    if (state.currentQuest == null) return;
    
    state = state.copyWith(isLoadingHistory: true);
    
    try {
      // Get all completed quests for this quest ID
      final allQuests = await _userQuestRepository.getAllQuests();
      final questHistory = allQuests.where((quest) => 
        quest.questId == state.currentQuest!.questId && 
        quest.isCompleted
      ).toList();
      
      // Sort by completion date (newest first)
      questHistory.sort((a, b) {
        if (a.userQuestCompletedAt == null) return 1;
        if (b.userQuestCompletedAt == null) return -1;
        return b.userQuestCompletedAt!.compareTo(a.userQuestCompletedAt!);
      });
      
      state = state.copyWith(
        completionHistory: questHistory,
        totalCompletions: questHistory.length,
        isLoadingHistory: false,
      );
    } catch (error) {
      print('완료 이력 로드 중 오류 발생: $error');
      state = state.copyWith(isLoadingHistory: false);
    }
  }

  // 퀘스트 완료
  Future<void> completeQuest() async {
    if (state.currentQuest == null) return;

    state = state.copyWith(
      isUpdatingStatus: true,
      successMessage: null,
      errorMessage: null,
    );

    try {
      await _userQuestRepository.completeQuest(userQuestId: _userQuestId);

      state = state.copyWith(
        isUpdatingStatus: false,
        successMessage: '퀘스트가 완료되었습니다!',
      );

      // Reload quest details and history
      await _loadQuestDetails();
      await _loadCompletionHistory();

      // Auto-remove success message
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          state = state.copyWith(successMessage: null);
        }
      });
    } catch (error) {
      state = state.copyWith(
        isUpdatingStatus: false,
        errorMessage: '퀘스트 완료 중 오류가 발생했습니다: $error',
      );

      // Auto-remove error message
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          state = state.copyWith(errorMessage: null);
        }
      });
    }
  }

  // 퀘스트 포기
  Future<void> abandonQuest() async {
    if (state.currentQuest == null) return;
    
    state = state.copyWith(
      isUpdatingStatus: true,
      successMessage: null,
      errorMessage: null,
    );
    
    try {
      await _userQuestRepository.failedQuest(userQuestId: _userQuestId);;
      
      state = state.copyWith(
        isUpdatingStatus: false,
        successMessage: '퀘스트를 포기했습니다.',
      );
      
      // Reload quest details
      await _loadQuestDetails();
      
      // Auto-remove success message
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          state = state.copyWith(successMessage: null);
        }
      });
    } catch (error) {
      state = state.copyWith(
        isUpdatingStatus: false,
        errorMessage: '퀘스트 포기 중 오류가 발생했습니다: $error',
      );
      
      // Auto-remove error message
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          state = state.copyWith(errorMessage: null);
        }
      });
    }
  }

  // 새로고침
  Future<void> refresh() async {
    await _initialize();
  }

  // 메시지 제거
  void clearMessages() {
    state = state.copyWith(successMessage: null, errorMessage: null);
  }
}

// Provider factory for quest detail
final questDetailViewModelProvider = StateNotifierProvider.family<QuestDetailViewModel, QuestDetailState, String>(
  (ref, userQuestId) => QuestDetailViewModel(userQuestId),
);