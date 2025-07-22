import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_main/quests_main_viewmodel.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/recommended_quest_card.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/active_quest_card.dart';
import 'package:todo_quest/feture/screens/profile/profile_screen.dart';
import 'package:todo_quest/repositories/auth_repository/auth_repository.dart';
import 'package:todo_quest/screens/login_screen.dart';

class QuestsMainScreen extends ConsumerWidget {
  const QuestsMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final questsMainState = ref.watch(questsMainViewModelProvider);

    final viewModel = ref.read(questsMainViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Quest - 퀘스트 목록'),
        actions: [
          authState.when(
            data: (user) {
              return user != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.person),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () async {
                            await ref.read(authRepositoryProvider).signOut();
                            if (context.mounted) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              viewModel.refreshQuests();
              viewModel.refreshActiveQuests();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display quests with populated data
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Success message
                  if (questsMainState.successMessage != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.green.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              questsMainState.successMessage!,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Error message
                  if (questsMainState.errorMessage != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.red.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.red, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              questsMainState.errorMessage!,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Active quests section
                  if (questsMainState.activeQuests.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '진행 중인 퀘스트',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (questsMainState.isLoadingActiveQuests)
                          const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 166,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: questsMainState.activeQuests.length,
                        itemBuilder: (context, index) {
                          final activeQuest =
                              questsMainState.activeQuests[index];
                          return Container(
                            width: 280,
                            margin: EdgeInsets.only(
                              right: index <
                                      questsMainState.activeQuests.length - 1
                                  ? 12
                                  : 0,
                            ),
                            child: activeQuestCard(
                              activeQuest,
                              viewModel.onClickActiveQuest,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 8),
                  ],

                  // Recommended quests section title
                  if (!questsMainState.isLoading &&
                      !questsMainState.isRefreshing &&
                      questsMainState.recommendedQuests.isNotEmpty)
                    const Text(
                      '추천 퀘스트',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 8),

                  // Show quests with populated categories and titles
                  Expanded(
                    child: questsMainState.isLoading ||
                            questsMainState.isRefreshing
                        ? const Center(child: CircularProgressIndicator())
                        : questsMainState.isSelectingQuest
                            ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 16),
                                    Text(
                                      '퀘스트를 시작하는 중...',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            : questsMainState.recommendedQuests.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.search_off,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          questsMainState.selectedCategory !=
                                                  null
                                              ? '선택한 카테고리에 퀘스트가 없습니다'
                                              : '사용 가능한 퀘스트가 없습니다',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: questsMainState
                                        .recommendedQuests.length,
                                    itemBuilder: (context, index) {
                                      final quest = questsMainState
                                          .recommendedQuests[index];
                                      return recommendedQuestCard(quest,
                                          viewModel.onClickRecommendedQuest);
                                    },
                                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
