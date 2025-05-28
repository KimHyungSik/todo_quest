import '../../models/user/user_info/user_profile.dart';
import '../../models/user/user_quest/user_quest.dart';
import '../../models/user/user_title/user_title.dart';

class UserRepository {
  final dynamic supabase; // SupabaseClient 타입

  UserRepository(this.supabase);

  /// 사용자 정보 가져오기
  Future<UserInfo?> getUserInfo([String? userId]) async {
    try {
      final result = await supabase.rpc('get_user_info', params: {
        if (userId != null) 'p_user_id': userId,
      });

      if (result is List && result.isNotEmpty) {
        return UserInfo.fromJson(result.first as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting user info: $e');
      return null;
    }
  }

  /// 사용자 퀘스트 가져오기
  Future<List<UserQuestInfo>> getUserQuests([String? userId, String? status]) async {
    try {
      final result = await supabase.rpc('get_user_quests', params: {
        if (userId != null) 'p_user_id': userId,
        if (status != null) 'p_status': status,
      });

      if (result is List) {
        return result
            .map((item) => UserQuestInfo.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting user quests: $e');
      return [];
    }
  }

  /// 사용자 타이틀 가져오기
  Future<List<UserTitleInfo>> getUserTitles([String? userId]) async {
    try {
      final result = await supabase.rpc('get_user_titles', params: {
        if (userId != null) 'p_user_id': userId,
      });

      if (result is List) {
        return result
            .map((item) => UserTitleInfo.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting user titles: $e');
      return [];
    }
  }

  /// 진행 중인 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getActiveQuests([String? userId]) async {
    return getUserQuests(userId, 'in_progress');
  }

  /// 완료된 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getCompletedQuests([String? userId]) async {
    return getUserQuests(userId, 'completed');
  }

  /// 대기 중인 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getPendingQuests([String? userId]) async {
    return getUserQuests(userId, 'pending');
  }
}

extension UserQuestListExtensions on List<UserQuestInfo> {
  /// 상태별로 필터링
  List<UserQuestInfo> byStatus(String status) =>
      where((quest) => quest.userQuestStatus == status).toList();

  /// 완료된 퀘스트들
  List<UserQuestInfo> get completed => byStatus('completed');

  /// 진행 중인 퀘스트들
  List<UserQuestInfo> get inProgress => byStatus('in_progress');

  /// 대기 중인 퀘스트들
  List<UserQuestInfo> get pending => byStatus('pending');

  /// 마감 임박한 퀘스트들
  List<UserQuestInfo> get deadlineApproaching =>
      where((quest) => quest.isDeadlineApproaching).toList();

  /// 마감 초과한 퀘스트들
  List<UserQuestInfo> get overdue =>
      where((quest) => quest.isOverdue).toList();

  /// 난이도별로 필터링
  List<UserQuestInfo> byDifficulty(int difficulty) =>
      where((quest) => quest.difficulty == difficulty).toList();

  /// 총 경험치 계산
  int get totalExp => fold(0, (sum, quest) => sum + quest.rewardsExp);

  /// 특정 카테고리 포함 퀘스트들
  List<UserQuestInfo> containsCategory(String category) =>
      where((quest) => quest.categories.contains(category)).toList();
}

extension UserTitleListExtensions on List<UserTitleInfo> {
  /// 최근 획득한 타이틀들 (7일 이내)
  List<UserTitleInfo> get recentlyAcquired =>
      where((title) => title.isRecentlyAcquired).toList();

  /// 타이틀명으로 검색
  UserTitleInfo? findByName(String name) =>
      cast<UserTitleInfo?>().firstWhere(
            (title) => title?.titleName == name,
        orElse: () => null,
      );
}