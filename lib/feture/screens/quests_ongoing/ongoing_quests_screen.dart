import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_ongoing/ongoing_quests_viewmodel.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/active_quest_card.dart';

class OngoingQuestsScreen extends ConsumerWidget {
  const OngoingQuestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ongoingQuestsState = ref.watch(ongoingQuestsViewModelProvider);
    final viewModel = ref.read(ongoingQuestsViewModelProvider.notifier);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.refreshQuests();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Success message
              if (ongoingQuestsState.successMessage != null)
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
                          ongoingQuestsState.successMessage!,
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
              if (ongoingQuestsState.errorMessage != null)
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
                          ongoingQuestsState.errorMessage!,
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
                    '진행 중인 퀘스트 (${ongoingQuestsState.activeQuests.length})',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (ongoingQuestsState.isLoading)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Quest list
              Expanded(
                child: ongoingQuestsState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ongoingQuestsState.activeQuests.isEmpty
                        ? _buildEmptyState(context)
                        : ListView.builder(
                            itemCount: ongoingQuestsState.activeQuests.length,
                            itemBuilder: (context, index) {
                              final activeQuest = ongoingQuestsState.activeQuests[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: activeQuestCard(
                                  activeQuest,
                                  viewModel.onClickActiveQuest,
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ongoingQuestsState.activeQuests.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () async {
                await viewModel.refreshQuests();
              },
              tooltip: '새로고침',
              child: const Icon(Icons.refresh),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 24),
          Text(
            '진행 중인 퀘스트가 없습니다',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '추천 퀘스트에서 새로운 퀘스트를 시작해보세요!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // The navigation will be handled by the parent navigation screen
              // This is just a visual element - actual navigation happens via bottom nav
            },
            icon: const Icon(Icons.explore),
            label: const Text('추천 퀘스트 보기'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}