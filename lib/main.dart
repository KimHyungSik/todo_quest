import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_quest/repositories/firestore_quest_repository/firestore_quest_repository.dart';

import 'firebase_options.dart';
import 'models/quest/quest.dart';

// 테스트를 위한 심플 프로바이더 - 한 번만 데이터를 가져옵니다
final testQuestProvider = FutureProvider<List<Quest>>((ref) async {
  final repository = FirestoreRepository();
  return repository.getAllQuests();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Firestore Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends ConsumerWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 데이터를 한 번만 가져옵니다
    final questsAsyncValue = ref.watch(testQuestProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore 테스트'),
      ),
      body: Center(
        child: questsAsyncValue.when(
          data: (quests) => quests.isEmpty
              ? const Text('데이터가 없습니다.')
              : ListView.builder(
            itemCount: quests.length,
            itemBuilder: (context, index) {
              final quest = quests[index];
              return ListTile(
                title: Text(quest.title),
                subtitle: Text(quest.short_description),
                trailing: Text('난이도: ${quest.difficulty_label}'),
                onTap: () {
                  // 퀘스트 데이터 출력
                  _showQuestDetails(context, quest);
                },
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('오류 발생: $error'),
        ),
      ),
    );
  }

  void _showQuestDetails(BuildContext context, Quest quest) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(quest.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('설명: ${quest.description}'),
            const SizedBox(height: 8),
            Text('난이도: ${quest.difficulty_label}'),
            const SizedBox(height: 8),
            Text('기간: ${quest.duration_days}일'),
            const SizedBox(height: 8),
            Text('보상: EXP +${quest.rewards['exp']}'),
            const SizedBox(height: 8),
            Text('태그: ${quest.tags.join(', ')}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }
}