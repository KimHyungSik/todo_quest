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
}

extension UserQuestListExtensions on List<UserQuestInfo> {
  /// 상태별로 필터링
  List<UserQuestInfo> byStatus(String status) =>
      where((quest) => quest.userQuestStatus == status).toList();
}
