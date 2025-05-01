import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final supabase = Supabase.instance.client;

  final currentUser = Supabase.instance.client.auth.currentUser;
  final authStateChanges = Supabase.instance.client.auth.onAuthStateChange
      .map((_) => Supabase.instance.client.auth.currentUser);

  Future<AuthResponse> signInAnonymous() async {
    return await supabase.auth.signInAnonymously();
  }

  Future<AuthResponse?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    print('LOGEE Google User: $googleUser');
    if (googleUser == null) {
      return null;
    }
    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    print('LOGEE Google Auth: $googleAuth');
    print('LOGEE Access Token: $accessToken');
    print('LOGEE ID Token: $idToken');
    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  // Sign in with Apple
  // Future<UserCredential?> signInWithApple() async {
  //   try {
  //     // Perform the sign-in request
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //
  //     // Create an OAuthCredential from the credential returned by Apple
  //     final oauthCredential = OAuthProvider("apple.com").credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );
  //
  //     // Check if we have an anonymous user that needs to be linked
  //     if (_auth.currentUser != null && _auth.currentUser!.isAnonymous) {
  //       // Link the anonymous account with Apple credential
  //       try {
  //         return await _auth.currentUser!.linkWithCredential(oauthCredential);
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'credential-already-in-use') {
  //           // If the Apple account already exists, sign in with it directly
  //           return await _auth.signInWithCredential(oauthCredential);
  //         } else {
  //           rethrow;
  //         }
  //       }
  //     } else {
  //       // Otherwise sign in with Apple credential directly
  //       return await _auth.signInWithCredential(oauthCredential);
  //     }
  //   } catch (e) {
  //     print('Error signing in with Apple: $e');
  //     rethrow;
  //   }
  // }

  // Sign out
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});
