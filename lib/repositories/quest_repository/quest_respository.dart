import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/models/category/quest_category.dart';
import 'package:todo_quest/models/quest/quest.dart';
import 'package:todo_quest/models/title/reward_title.dart';

class QuestRepository {
  final supabase = Supabase.instance.client;

  // Fetch quests from Supabase
  Future<List<Quest>> getQuests() async {
    final response = await supabase.rpc("new_quest");
    final List<Quest> quests =
        response.map<Quest>((res) => Quest.fromJson(res)).toList();
    return quests;
  }

  // Fetch a specific reward title by ID
  Future<RewardTitle?> getRewardTitle(int titleId) async {
    final response =
        await supabase.from('titles').select().eq('id', titleId).single();

    if (response != null) {
      return RewardTitle.fromJson(response);
    }
    return null;
  }

  // Fetch multiple categories by their IDs
  Future<List<QuestCategory>> getCategories(List<int> categoryIds) async {
    if (categoryIds.isEmpty) return [];

    final response = await supabase
        .from('categories')
        .select()
        .filter('id', 'in', categoryIds);
    return response.map((res) => QuestCategory.fromJson(res)).toList();
  }

  // Fetch quests with populated title and categories data
  Future<List<Quest>> getQuestsWithRelations() async {
    // 1. Get basic quests
    final List<Quest> quests = await getQuests();

    // 2. Collect all required title IDs and category IDs
    final Set<int> titleIds = quests.map((q) => q.rewardTitleId).toSet();
    final Set<int> categoryIds = {};
    for (var quest in quests) {
      if (quest.categoriesId != null) {
        categoryIds.addAll(quest.categoriesId!);
      }
    }

    // 3. Fetch all titles and categories at once to minimize network requests
    final Map<int, RewardTitle> titleMap = {};
    for (var titleId in titleIds) {
      final title = await getRewardTitle(titleId);
      if (title != null) {
        titleMap[titleId] = title;
      }
    }

    final List<QuestCategory> categories =
        await getCategories(categoryIds.toList());
    final Map<int, QuestCategory> categoryMap = {
      for (var category in categories) category.id: category
    };

    // 4. Populate each quest with its title and categories
    final List<Quest> populatedQuests = quests.map((quest) {
      // Get the reward title for this quest
      final rewardTitle = titleMap[quest.rewardTitleId];

      // Get the categories for this quest
      List<QuestCategory>? questCategories;
      if (quest.categoriesId != null && quest.categoriesId!.isNotEmpty) {
        questCategories = quest.categoriesId!
            .map((id) => categoryMap[id.toString()])
            .whereType<QuestCategory>()
            .toList();
      }

      // Return a new quest with populated relations
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

// Add a provider for quests with populated relations
final questsWithRelationsProvider = FutureProvider<List<Quest>>((ref) async {
  final repository = ref.watch(questRepositoryProvider);
  return repository.getQuestsWithRelations();
});
