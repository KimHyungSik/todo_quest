import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/feture/screens/quests_main/quests_main_viewmodel.dart';
import 'package:todo_quest/feture/screens/quests_main/widget/recommended_quest_card.dart';
import 'package:todo_quest/models/quest/quest.dart';
import 'package:todo_quest/repositories/auth_repository/auth_repository.dart';
import 'package:todo_quest/repositories/quest_repository/quest_respository.dart';
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
                  ? IconButton(
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
                    )
                  : const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.refresh(questsWithRelationsProvider);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info section
          authState.when(
            data: (user) {
              if (user == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                });
                return const SizedBox.shrink();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${user.email ?? '사용자'}님의 퀘스트',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('인증 오류: $error'),
            ),
          ),

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
                    child: ListView.builder(
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
