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

  Future<UserCredential?> signInAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
    return null;
  }

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

      // Check if we have an anonymous user that needs to be linked
      if (_auth.currentUser != null && _auth.currentUser!.isAnonymous) {
        // Link the anonymous account with Google credential
        try {
          return await _auth.currentUser!.linkWithCredential(credential);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'credential-already-in-use') {
            // If the Google account already exists, sign in with it directly
            return await _auth.signInWithCredential(credential);
          } else {
            rethrow;
          }
        }
      } else {
        // Otherwise sign in with Google credential directly
        return await _auth.signInWithCredential(credential);
      }
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

      // Check if we have an anonymous user that needs to be linked
      if (_auth.currentUser != null && _auth.currentUser!.isAnonymous) {
        // Link the anonymous account with Apple credential
        try {
          return await _auth.currentUser!.linkWithCredential(oauthCredential);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'credential-already-in-use') {
            // If the Apple account already exists, sign in with it directly
            return await _auth.signInWithCredential(oauthCredential);
          } else {
            rethrow;
          }
        }
      } else {
        // Otherwise sign in with Apple credential directly
        return await _auth.signInWithCredential(oauthCredential);
      }
    } catch (e) {
      print('Error signing in with Apple: $e');
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}