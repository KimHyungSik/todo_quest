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

  bool isIOS() {
    return Platform.isIOS;
  }

  Future<AuthResponse?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }
    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    var supabaseGoogleAuth = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return supabaseGoogleAuth;
  }

  // Sign in with Apple
  Future<AuthResponse?> signInWithApple() async {
      // Perform the sign-in request
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      var idToken = appleCredential.identityToken;

      if(idToken == null){
        throw 'No ID Token found.';
      }

      var supabseAppleAuth = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        accessToken: appleCredential.authorizationCode
      );

      return supabseAppleAuth;
  }

  // Sign out
  Future<void> signOut() async {
    if (_googleSignIn.currentUser != null) {
      await _googleSignIn.signOut();
    }
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
