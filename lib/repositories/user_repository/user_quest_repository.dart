import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/quest/quest.dart';
import '../../models/user/user_quest/user_quest.dart';
import '../../models/user/user_title/user_title.dart';

class UserQuestRepository {
  final dynamic supabase; // SupabaseClient 타입

  UserQuestRepository(this.supabase);

  /// 사용자의 퀘스트 정보를 가져오는 기본 함수
  ///
  /// [userId] - 특정 사용자 ID (null이면 현재 로그인된 사용자)
  /// [status] - 퀘스트 상태 필터 ('pending', 'in_progress', 'completed', 'cancelled')
  Future<List<UserQuestInfo>> getUserQuests({
    String? userId,
    String? status,
  }) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null && userId == null) {
        throw Exception('로그인이 필요합니다.');
      }

      final targetUserId = userId ?? currentUser!.id;

      final response = await supabase.rpc('get_user_quests', params: {
        'p_user_id': targetUserId,
        if (status != null) 'p_status': status,
      });

      print("LOGEE $response");

      if (response == null) {
        throw Exception('서버 응답이 없습니다.');
      }

      final result = response as Map<String, dynamic>;

      if (result['success'] == true) {
        final questsData = result['data']['quests'] as List;
        return questsData
            .map((questData) => UserQuestInfo.fromJson(questData as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(result['message'] ?? '퀘스트 조회 실패');
      }
    } catch (e) {
      print('사용자 퀘스트 조회 중 오류 발생: $e');
      rethrow;
    }
  }

  /// 모든 퀘스트 가져오기
  Future<List<UserQuestInfo>> getAllQuests([String? userId]) async {
    return getUserQuests(userId: userId);
  }

  /// 대기 중인 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getPendingQuests([String? userId]) async {
    return getUserQuests(userId: userId, status: 'pending');
  }

  /// 진행 중인 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getActiveQuests([String? userId]) async {
    return getUserQuests(userId: userId, status: 'in_progress');
  }

  /// 완료된 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getCompletedQuests([String? userId]) async {
    return getUserQuests(userId: userId, status: 'completed');
  }

  /// 취소된 퀘스트만 가져오기
  Future<List<UserQuestInfo>> getCancelledQuests([String? userId]) async {
    return getUserQuests(userId: userId, status: 'cancelled');
  }

  /// 퀘스트 상태 업데이트
  Future<bool> updateQuestStatus({
    required String userQuestId,
    required String newStatus,
    String? userId,
  }) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null && userId == null) {
        throw Exception('로그인이 필요합니다.');
      }

      final targetUserId = userId ?? currentUser!.id;

      final response = await supabase.rpc('update_quest_status', params: {
        'p_user_id': targetUserId,
        'p_user_quest_id': userQuestId,
        'p_new_status': newStatus,
      });

      if (response == null) {
        throw Exception('서버 응답이 없습니다.');
      }

      final result = response as Map<String, dynamic>;

      if (result['success'] != true) {
        throw Exception(result['message'] ?? '상태 업데이트 실패');
      }

      return true;
    } catch (e) {
      print('퀘스트 상태 업데이트 중 오류 발생: $e');
      rethrow;
    }
  }

  /// 퀘스트 완료
  Future<Map<String, dynamic>> completeQuest({
    required String userQuestId,
    String? userId,
  }) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null && userId == null) {
        throw Exception('로그인이 필요합니다.');
      }

      final targetUserId = userId ?? currentUser!.id;

      final response = await supabase.rpc('complete_quest', params: {
        'p_user_id': targetUserId,
        'p_user_quest_id': userQuestId,
      });

      if (response == null) {
        throw Exception('서버 응답이 없습니다.');
      }

      final result = response as Map<String, dynamic>;

      if (result['success'] != true) {
        throw Exception(result['message'] ?? '퀘스트 완료 실패');
      }

      // 완료 정보 반환
      return {
        'questTitle': result['data']?['quest_title'],
        'rewardsExp': result['data']?['rewards_exp'] ?? 0,
        'hasTitleReward': result['data']?['has_title_reward'] ?? false,
      };
    } catch (e) {
      print('퀘스트 완료 중 오류 발생: $e');
      rethrow;
    }
  }

  /// 퀘스트 시작
  Future<String> startQuest(String questId, [String? userId]) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null && userId == null) {
        throw Exception('로그인이 필요합니다.');
      }

      final targetUserId = userId ?? currentUser!.id;

      final response = await supabase.rpc('start_quest', params: {
        'p_user_id': targetUserId,
        'p_quest_id': questId,
      });

      if (response == null) {
        throw Exception('서버 응답이 없습니다.');
      }

      final result = response as Map<String, dynamic>;

      if (result['success'] != true) {
        throw Exception(result['message'] ?? '퀘스트 시작 실패');
      }

      // 생성된 user_quest_id 반환
      return result['data']['user_quest_id'] as String;
    } catch (e) {
      print('퀘스트 시작 중 오류 발생: $e');
      rethrow;
    }
  }

  /// 퀘스트 선택
  Future<String> selectQuest(String questId, [String? userId]) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null && userId == null) {
        throw Exception('로그인이 필요합니다.');
      }

      final targetUserId = userId ?? currentUser!.id;

      final response = await supabase.rpc('select_quest', params: {
        'p_user_id': targetUserId,
        'p_quest_id': questId,
      });

      if (response == null) {
        throw Exception('서버 응답이 없습니다.');
      }

      final result = response as Map<String, dynamic>;

      if (result['success'] != true) {
        throw Exception(result['message'] ?? '퀘스트 선택 실패');
      }

      // 생성된 user_quest_id 반환
      return result['data']['user_quest_id'] as String;
    } catch (e) {
      print('퀘스트 선택 중 오류 발생: $e');
      rethrow;
    }
  }
}