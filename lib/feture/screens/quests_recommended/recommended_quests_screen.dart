import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_recommended/recommended_quests_viewmodel.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/recommended_quest_card.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/category_selector.dart';

class RecommendedQuestsScreen extends ConsumerWidget {
  const RecommendedQuestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedQuestsState = ref.watch(recommendedQuestsViewModelProvider);
    final viewModel = ref.read(recommendedQuestsViewModelProvider.notifier);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.refreshQuests();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category selector
            if (recommendedQuestsState.categories.isNotEmpty) ...[
              const SizedBox(height: 8),
              CategorySelector(
                categories: recommendedQuestsState.categories,
                selectedCategory: recommendedQuestsState.selectedCategory,
                onCategorySelected: viewModel.selectCategory,
              ),
              const SizedBox(height: 16),
            ],

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Success message
                    if (recommendedQuestsState.successMessage != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                recommendedQuestsState.successMessage!,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Error message
                    if (recommendedQuestsState.errorMessage != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                recommendedQuestsState.errorMessage!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Quest count and status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recommendedQuestsState.selectedCategory != null
                              ? '${recommendedQuestsState.selectedCategory!.name} (${recommendedQuestsState.recommendedQuests.length})'
                              : '추천 퀘스트 (${recommendedQuestsState.recommendedQuests.length})',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (recommendedQuestsState.isLoading || recommendedQuestsState.isSelectingQuest)
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Quest selection loading
                    if (recommendedQuestsState.isSelectingQuest)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트를 시작하는 중...',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Quest list
                    Expanded(
                      child: recommendedQuestsState.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : recommendedQuestsState.recommendedQuests.isEmpty
                              ? _buildEmptyState(context, recommendedQuestsState.selectedCategory?.name)
                              : ListView.builder(
                                  itemCount: recommendedQuestsState.recommendedQuests.length,
                                  itemBuilder: (context, index) {
                                    final quest = recommendedQuestsState.recommendedQuests[index];
                                    return recommendedQuestCard(
                                      quest,
                                      viewModel.onClickRecommendedQuest,
                                    );
                                  },
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await viewModel.refreshQuests();
        },
        tooltip: '새로고침',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, String? selectedCategoryName) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 24),
          Text(
            selectedCategoryName != null
                ? '선택한 카테고리에 퀘스트가 없습니다'
                : '사용 가능한 퀘스트가 없습니다',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            selectedCategoryName != null
                ? '다른 카테고리를 선택해보시거나 새로고침을 시도해보세요'
                : '새로고침을 시도하거나 나중에 다시 확인해보세요',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}