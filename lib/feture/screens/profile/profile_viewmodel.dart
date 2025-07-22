import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/feture/screens/profile/state/profile_state.dart';
import '../../../models/quest/category/quest_category.dart';
import '../../../repositories/quest_repository/quest_respository.dart';
import '../../../repositories/user_repository/user_repository.dart';
import '../../../repositories/user_repository/user_quest_repository.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel() : super(ProfileState()) {
    _initialize();
  }

  final QuestRepository _questRepository = QuestRepository();
  final UserRepository _userRepository = UserRepository(Supabase.instance.client);
  final UserQuestRepository _userQuestRepository = UserQuestRepository(Supabase.instance.client);

  Future<void> _initialize() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      // Load user info and categories in parallel
      final userInfoFuture = _userRepository.getUserInfo();
      final categoriesFuture = _questRepository.getAllCategories();
      
      final userInfo = await userInfoFuture;
      final categories = await categoriesFuture;
      
      state = state.copyWith(
        userInfo: userInfo,
        allCategories: categories,
        isLoading: false,
      );
      
      // Load quest statistics after basic profile loads
      await _loadQuestStatistics();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  void toggleCategory(QuestCategory category) {
    final currentSelected = List<QuestCategory>.from(state.selectedCategories);
    
    if (currentSelected.any((c) => c.id == category.id)) {
      // Remove category
      currentSelected.removeWhere((c) => c.id == category.id);
    } else {
      // Add category
      currentSelected.add(category);
    }
    
    state = state.copyWith(selectedCategories: currentSelected);
  }

  void selectAllCategories() {
    state = state.copyWith(selectedCategories: [...state.allCategories]);
  }

  void clearAllCategories() {
    state = state.copyWith(selectedCategories: []);
  }

  bool isCategorySelected(QuestCategory category) {
    return state.selectedCategories.any((c) => c.id == category.id);
  }

  Future<void> savePreferences() async {
    state = state.copyWith(isSaving: true, errorMessage: null);
    
    try {
      // TODO: Implement saving category preferences to backend
      // For now, we'll just simulate saving
      await Future.delayed(const Duration(seconds: 1));
      
      state = state.copyWith(isSaving: false);
      // TODO: Show success message
    } catch (error) {
      state = state.copyWith(
        isSaving: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> refreshProfile() async {
    await _initialize();
  }

  // Load quest statistics
  Future<void> _loadQuestStatistics() async {
    state = state.copyWith(isLoadingStats: true);
    
    try {
      // Load all user quests
      final allUserQuests = await _userQuestRepository.getAllQuests();
      
      // Calculate statistics
      final completedCount = allUserQuests.where((q) => q.isCompleted).length;
      final activeCount = allUserQuests.where((q) => q.isInProgress).length;
      final pendingCount = allUserQuests.where((q) => q.isPending).length;
      final totalCount = allUserQuests.length;
      
      state = state.copyWith(
        isLoadingStats: false,
        completedQuestsCount: completedCount,
        activeQuestsCount: activeCount,
        pendingQuestsCount: pendingCount,
        totalQuestsCount: totalCount,
      );
    } catch (error) {
      print('퀘스트 통계 로드 중 오류 발생: $error');
      state = state.copyWith(isLoadingStats: false);
    }
  }

  // Refresh quest statistics
  Future<void> refreshQuestStatistics() async {
    await _loadQuestStatistics();
  }
}

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  return ProfileViewModel();
});