import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_quest/repositories/auth_repository/auth_repository.dart';
import 'package:todo_quest/screens/quest_list_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Quest - Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display logo or app name
            const Center(
              child: Text(
                'Todo Quest',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Google Sign-In Button
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text('Google로 로그인'),
              onPressed: () async {
                try {
                  final userCredential = await ref.read(authRepositoryProvider).signInWithGoogle();
                  if (userCredential != null && userCredential.user != null) {
                    print('로그인 성공: ${userCredential.user!.email}');
                    
                    // Navigate to quest list screen after successful login
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const QuestListScreen(),
                        ),
                      );
                    }
                  }
                } catch (e) {
                  print('로그인 실패: $e');
                }
              },
            ),

            // Apple Sign-In Button (iOS only)
            if (ref.read(authRepositoryProvider).isIOS())
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.apple),
                  label: const Text('Apple로 로그인'),
                  onPressed: () async {
                    try {
                      final userCredential = await ref.read(authRepositoryProvider).signInWithApple();
                      if (userCredential != null && userCredential.user != null) {
                        print('애플 로그인 성공: ${userCredential.user!.email}');
                        
                        // Navigate to quest list screen after successful login
                        if (context.mounted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const QuestListScreen(),
                            ),
                          );
                        }
                      }
                    } catch (e) {
                      print('애플 로그인 실패: $e');
                    }
                  },
                ),
              ),

            const SizedBox(height: 20),

            // Display authentication state
            authState.when(
              data: (user) {
                if (user == null) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '계정으로 로그인하여 퀘스트를 시작하세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                } else {
                  // If already logged in, navigate to quest list
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const QuestListScreen(),
                      ),
                    );
                  });
                  return const SizedBox.shrink();
                }
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('인증 오류: $error'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}