import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Check if the device is iOS
  bool get isIOS => Platform.isIOS;

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        return null; // User canceled the sign-in flow
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  // Sign in with Apple
  Future<UserCredential?> signInWithApple() async {
    try {
      // Perform the sign-in request
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create an OAuthCredential from the credential returned by Apple
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in the user with Firebase
      return await _auth.signInWithCredential(oauthCredential);
    } catch (e) {
      print('Error signing in with Apple: $e');
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    if (Platform.isIOS) {
      // No specific sign out needed for Apple
    } else {
      await _googleSignIn.signOut();
    }
    await _auth.signOut();
  }
}