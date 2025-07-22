import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_main/quests_main_viewmodel.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/recommended_quest_card.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/category_selector.dart';
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
                  const Text(
                    '퀘스트 목록',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Show quests with populated categories and titles
                  Expanded(
                    child: questsMainState.isLoading || questsMainState.isRefreshing
                        ? const Center(child: CircularProgressIndicator())
                        : questsMainState.recommendedQuests.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.search_off,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      questsMainState.selectedCategory != null
                                          ? '선택한 카테고리에 퀘스트가 없습니다'
                                          : '사용 가능한 퀘스트가 없습니다',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: questsMainState.recommendedQuests.length,
                                itemBuilder: (context, index) {
                                  final quest = questsMainState.recommendedQuests[index];
                                  return recommendedQuestCard(
                                      quest,
                                      viewModel.onClickRecommendedQuest
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
    );
  }
}
