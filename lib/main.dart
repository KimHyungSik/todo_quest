import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_quest/repositories/firestore_quest_repository/firestore_quest_repository.dart';
import 'package:todo_quest/repositories/auth_repository/auth_repository.dart';

import 'firebase_options.dart';
import 'models/quest/quest.dart';

// 테스트를 위한 심플 프로바이더 - 한 번만 데이터를 가져옵니다
final testQuestProvider = FutureProvider<List<Quest>>((ref) async {
  final repository = FirestoreRepository();
  return repository.getAllQuests();
});

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Auth state provider
final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Sign in anonymously if no user is already signed in
  final FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    try {
      await auth.signInAnonymously();
      print("Signed in with temporary anonymous account");
    } catch (e) {
      print("Anonymous auth error: $e");
    }
  }

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
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore 테스트'),
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
                if (ref.read(authRepositoryProvider).isIOS)
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
              ],
            ),
          ),
          
          // Display user info if logged in
          authState.when(
            data: (user) {
              print("LOGEE $user");
              if (user == null) {
                return const SizedBox.shrink();
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
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('인증 오류: $error'),
          ),
          
          // Quest list
          Expanded(
            child: Center(
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
          ),
        ],
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