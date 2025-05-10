import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/key/api_key.dart';
import 'package:todo_quest/repositories/auth_repository/auth_repository.dart';

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

    return Scaffold(
      appBar: AppBar(
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
              ],
            ),
          ),
          
          // Display user info if logged in
          authState.when(
            data: (user) {
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
        ],
      ),
    );
  }
}