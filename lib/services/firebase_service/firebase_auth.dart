import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  static FirebaseAuth instance = FirebaseAuth.instance;

  static Stream<User?> getUserStream() {
    return instance.userChanges();
  }

  static void signInGoogle() {
    if (kIsWeb) {
      _signInWithGoogleWeb();
    } else {
      _signInWithGoogle();
    }
  }

  static Future<UserCredential?> _signInWithGoogleWeb() async {
    GoogleAuthProvider provider = GoogleAuthProvider();
    provider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    provider.setCustomParameters({'login_hint': 'user@example.com'});

    return await instance.signInWithPopup(provider);
  }

  static Future<UserCredential?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await instance.signInWithCredential(credential);
    }
    return null;
  }
}
