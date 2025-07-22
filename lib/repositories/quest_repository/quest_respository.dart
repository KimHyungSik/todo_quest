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

  // 모든 카테고리 가져오기
  Future<List<QuestCategory>> getAllCategories() async {
    try {
      final response = await supabase
          .from(QuestConstants.categoriesTable)
          .select();
      
      return response
          .map<QuestCategory>((res) => QuestCategory.fromJson(res))
          .toList();
    } catch (e) {
      print('카테고리를 가져오는 중 오류 발생: $e');
      return [];
    }
  }

  // 타이틀과 카테고리 데이터가 포함된 퀘스트 가져오기
  Future<List<Quest>> getQuestsWithRelations() async {
    final List<Quest> quests = await getQuestRecommendations();
    return quests;
  }
}

final questRepositoryProvider = Provider<QuestRepository>((ref) {
  return QuestRepository();
});

// 퀘스트를 위한 프로바이더 추가
final questsWithRelationsProvider = FutureProvider<List<Quest>>((ref) async {
  final repository = ref.watch(questRepositoryProvider);
  return repository.getQuestsWithRelations();
});

// 카테고리 프로바이더 추가
final categoriesProvider = FutureProvider<List<QuestCategory>>((ref) async {
  final repository = ref.watch(questRepositoryProvider);
  return repository.getAllCategories();
});
