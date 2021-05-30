import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get() => _user;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      if (googleUser == null) return;
      _user = googleUser;
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
