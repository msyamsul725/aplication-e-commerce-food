import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  LoginView? view;
  bool isLoging = false;

  void googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      Get.offAll(const FloatMainNavigationView());
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: userCredential");
      //TODO: on login success
      //------------------
    } catch (_) {}
  }
}
