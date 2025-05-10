import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/models/category/quest_category.dart';
import 'package:todo_quest/models/quest/quest.dart';
import 'package:todo_quest/models/title/reward_title.dart';
import 'package:todo_quest/repositories/quest_repository/quest_constants.dart';

class QuestRepository {
  final supabase = Supabase.instance.client;

  // Supabase에서 퀘스트 가져오기
  Future<List<Quest>> getQuests() async {
    final response = await supabase.rpc(QuestConstants.newQuestFunction);
    final List<Quest> quests =
        response.map<Quest>((res) => Quest.fromJson(res)).toList();
    return quests;
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
    // 1. 기본 퀘스트 가져오기
    final List<Quest> quests = await getQuests();

    // 2. 필요한 모든 타이틀 ID와 카테고리 ID 수집
    final Set<int> titleIds = quests.map((q) => q.rewardTitleId).toSet();
    final Set<int> categoryIds = {};
    for (var quest in quests) {
      if (quest.categoriesId != null) {
        categoryIds.addAll(quest.categoriesId!);
      }
    }

    // 3. 네트워크 요청을 최소화하기 위해 모든 타이틀과 카테고리를 한 번에 가져오기
    final List<RewardTitle> rewardTitles =
        await getRewardTitles(titleIds.toList());
    final Map<int, RewardTitle> titleMap = {
      for (var title in rewardTitles) title.id: title
    };

    final List<QuestCategory> categories =
        await getCategories(categoryIds.toList());
    final Map<int, QuestCategory> categoryMap = {
      for (var category in categories) category.id: category
    };

    // 4. 각 퀘스트에 타이틀과 카테고리 정보 채우기
    final List<Quest> populatedQuests = quests.map((quest) {
      // 이 퀘스트의 보상 타이틀 가져오기
      final rewardTitle = titleMap[quest.rewardTitleId];

      // 이 퀘스트의 카테고리 가져오기
      List<QuestCategory>? questCategories;
      if (quest.categoriesId != null && quest.categoriesId!.isNotEmpty) {
        questCategories = quest.categoriesId!
            .map((id) => categoryMap[id.toString()])
            .whereType<QuestCategory>()
            .toList();
      }

      // 정보가 채워진 새 퀘스트 반환
      return quest.copyWithRelations(
        rewardTitle: rewardTitle,
        categories: questCategories,
      );
    }).toList();

    return populatedQuests;
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
