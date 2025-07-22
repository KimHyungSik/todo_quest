import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/models/quest/quest.dart';
import 'package:todo_quest/repositories/quest_repository/quest_constants.dart';

import '../../models/quest/category/quest_category.dart';
import '../../models/quest/title/reward_title.dart';

class QuestRepository {
  final supabase = Supabase.instance.client;

  /// 퀘스트 추천을 가져오는 함수
  ///
  /// [categoryId] - 특정 카테고리의 퀘스트만 가져오려면 카테고리 ID를 제공
  /// [difficulty] - 특정 난이도의 퀘스트만 가져오려면 난이도(1~5)를 제공
  /// [searchText] - 제목이나 설명에서 특정 텍스트를 검색하려면 검색어를 제공
  /// [random] - 결과를 랜덤으로 정렬할지 여부
  /// [limit] - 가져올 최대 퀘스트 수
  Future<List<Quest>> getQuestRecommendations({
    String? categoryId,
    int? difficulty,
    String? searchText,
    bool random = true,
    int limit = 3,
  }) async {
    try {
      final response = await supabase.rpc(
        QuestConstants.getQuests,
        params: {
          'p_category_id': categoryId,
          'p_difficulty': difficulty,
          'p_search_text': searchText,
          'p_random': random,
          'p_limit': limit,
        },
      );

      if (response == null) {
        return [];
      }

      // JSON 배열을 Quest 객체 리스트로 변환
      final List<Quest> quests = (response as List)
          .map((data) => Quest.fromJson(data))
          .toList();

      return quests;
    } catch (e) {
      print('퀘스트 추천을 가져오는 중 오류 발생: $e');
      return [];
    }
  }

  /// 퀘스트를 시작하는 함수
  ///
  /// [questId] - 시작할 퀘스트의 ID
  /// 반환값: QuestStartResult 객체 (성공/실패 상태와 메시지 포함)
  Future<QuestStartResult> startQuest(String questId) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null) {
        return QuestStartResult(
          success: false,
          message: '로그인이 필요합니다.',
        );
      }

      final response = await supabase.rpc(
        'start_quest',
        params: {
          'p_user_id': currentUser.id,
          'p_quest_id': questId,
        },
      );

      if (response == null) {
        return QuestStartResult(
          success: false,
          message: '서버 응답이 없습니다.',
        );
      }

      final result = response as Map<String, dynamic>;

      return QuestStartResult(
        success: result['success'] ?? false,
        message: result['message'] ?? '알 수 없는 오류가 발생했습니다.',
        userQuestId: result['data']?['user_quest_id'],
        questTitle: result['data']?['quest_title'],
      );

    } catch (e) {
      print('퀘스트 시작 중 오류 발생: $e');
      return QuestStartResult(
        success: false,
        message: '퀘스트 시작 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 퀘스트를 선택하는 함수 (기존 select_quest 함수 사용)
  ///
  /// [questId] - 선택할 퀘스트의 ID
  /// 반환값: QuestSelectResult 객체
  Future<QuestSelectResult> selectQuest(String questId) async {
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null) {
        return QuestSelectResult(
          success: false,
          message: '로그인이 필요합니다.',
        );
      }

      final response = await supabase.rpc(
        'select_quest',
        params: {
          'p_user_id': currentUser.id,
          'p_quest_id': questId,
        },
      );

      if (response == null) {
        return QuestSelectResult(
          success: false,
          message: '서버 응답이 없습니다.',
        );
      }

      final result = response as Map<String, dynamic>;

      return QuestSelectResult(
        success: result['success'] ?? false,
        message: result['message'] ?? '알 수 없는 오류가 발생했습니다.',
        userQuestId: result['data']?['user_quest_id'],
      );

    } catch (e) {
      print('퀘스트 선택 중 오류 발생: $e');
      return QuestSelectResult(
        success: false,
        message: '퀘스트 선택 중 오류가 발생했습니다: $e',
      );
    }
  }

  // ID로 특정 보상 타이틀 가져오기
  Future<RewardTitle> getRewardTitle(int titleId) async {
    final response = await supabase
        .from(QuestConstants.titlesTable)
        .select()
        .eq(QuestConstants.idField, titleId)
        .single();

    return RewardTitle.fromJson(response);
  }

  Future<List<RewardTitle>> getRewardTitles(List<int> titleIds) async {
    final response = await supabase
        .from(QuestConstants.titlesTable)
        .select()
        .filter(QuestConstants.idField, 'in', titleIds);
    ;

    return response
        .map<RewardTitle>((res) => RewardTitle.fromJson(res))
        .toList();
  }

  // ID 목록으로 여러 카테고리 가져오기
  Future<List<QuestCategory>> getCategories(List<int> categoryIds) async {
    if (categoryIds.isEmpty) return [];

    final response = await supabase
        .from(QuestConstants.categoriesTable)
        .select()
        .filter(QuestConstants.idField, 'in', categoryIds);
    return response
        .map<QuestCategory>((res) => QuestCategory.fromJson(res))
        .toList();
  }

  // 타이틀과 카테고리 데이터가 포함된 퀘스트 가져오기
  Future<List<Quest>> getQuestsWithRelations() async {
    final List<Quest> quests = await getQuestRecommendations();
    return quests;
  }
}

/// 퀘스트 시작 결과 클래스
class QuestStartResult {
  final bool success;
  final String message;
  final String? userQuestId;
  final String? questTitle;

  QuestStartResult({
    required this.success,
    required this.message,
    this.userQuestId,
    this.questTitle,
  });
}

/// 퀘스트 선택 결과 클래스
class QuestSelectResult {
  final bool success;
  final String message;
  final String? userQuestId;

  QuestSelectResult({
    required this.success,
    required this.message,
    this.userQuestId,
  });
}

final questRepositoryProvider = Provider<QuestRepository>((ref) {
  return QuestRepository();
});

// 퀘스트를 위한 프로바이더 추가
final questsWithRelationsProvider = FutureProvider<List<Quest>>((ref) async {
  final repository = ref.watch(questRepositoryProvider);
  return repository.getQuestsWithRelations();
});

// 퀘스트 시작을 위한 프로바이더 추가
final startQuestProvider = Provider<Future<QuestStartResult> Function(String)>((ref) {
  final repository = ref.watch(questRepositoryProvider);
  return (String questId) => repository.startQuest(questId);
});
