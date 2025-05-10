import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/key/api_key.dart';
import 'package:todo_quest/models/category/quest_category.dart';
import 'package:todo_quest/repositories/auth_repository/auth_repository.dart';
import 'package:todo_quest/repositories/quest_repository/quest_respository.dart';

import 'models/quest/quest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
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
    final authState = ref.watch(authStateProvider);
    // Use our new provider for quests with relations
    final questsState = ref.watch(questsWithRelationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Quest'),
        actions: [
          authState.when(
            data: (user) {
              return user != null
                  ? IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        ref.read(authRepositoryProvider).signOut();
                      },
                    )
                  : const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Login Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Google Sign-In Button
                ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text('Google로 로그인'),
                  onPressed: () async {
                    try {
                      final userCredential =
                          await ref.read(authRepositoryProvider).signInWithGoogle();
                      if (userCredential != null && userCredential.user != null) {
                        print('로그인 성공: ${userCredential.user!.email}');
                      }
                    } catch (e) {
                      print('로그인 실패: $e');
                    }
                  },
                ),

                // Apple Sign-In Button (iOS only)
                if (ref.read(authRepositoryProvider).isIOS())
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.apple),
                      label: const Text('Apple로 로그인'),
                      onPressed: () async {
                        try {
                          final userCredential =
                              await ref.read(authRepositoryProvider).signInWithApple();
                          if (userCredential != null && userCredential.user != null) {
                            print('애플 로그인 성공: ${userCredential.user!.email}');
                          }
                        } catch (e) {
                          print('애플 로그인 실패: $e');
                        }
                      },
                    ),
                  ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('로그아웃'),
                  onPressed: () async {
                    ref.read(authRepositoryProvider).signOut();
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.file_download),
                  label: const Text('퀘스트 가져오기'),
                  onPressed: () async {
                    // Use our provider to refresh quests with relations
                    ref.refresh(questsWithRelationsProvider);
                  },
                ),
              ],
            ),
          ),

          // Display user info if logged in
          authState.when(
            data: (user) {
              if (user == null) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('로그인이 필요합니다'),
                );
              } else if (user.isAnonymous) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('임시 익명 계정으로 로그인됨'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('로그인됨: ${user.email}'),
                );
              }
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Padding(
              padding: const EdgeInsets.all(8.0),
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
                    child: questsState.when(
                      data: (quests) {
                        if (quests.isEmpty) {
                          return const Center(
                            child: Text('퀘스트가 없습니다'),
                          );
                        }

                        return ListView.builder(
                          itemCount: quests.length,
                          itemBuilder: (context, index) {
                            final quest = quests[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Quest title
                                    Text(
                                      quest.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                    // Quest description
                                    if (quest.description != null)
                                      Text(quest.description!),
                                    const SizedBox(height: 8),

                                    // Display reward title if available
                                    if (quest.rewardTitle != null)
                                      Text(
                                        '보상: ${quest.rewardTitle!.name}',
                                        style: TextStyle(
                                          color: Colors.green.shade700,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                    // Show quest categories if available
                                    if (quest.categoriesList != null && quest.categoriesList!.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Wrap(
                                          spacing: 8,
                                          children: quest.categoriesList!.map((category) {
                                            return Chip(
                                              label: Text(category.name),
                                              backgroundColor: Colors.blue.shade100,
                                              labelStyle: const TextStyle(fontSize: 12),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stack) {
                        print("퀘스트 로딩 오류: $error");
                        return Center(
                          child: Text('퀘스트 로딩 오류: $error'),
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