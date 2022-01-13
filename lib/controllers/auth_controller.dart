import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/views/login_view.dart';
import 'package:getx_app/views/welcome_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static final AuthController instance = Get.find();

  late Rx<User?> _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges()); // Listen to changes on user state
    ever(_user, _startScreen);
  }

  _startScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginView());
    } else {
      Get.offAll(() => WelcomeView(
            email: user.email ?? 'Not found',
          ));
    }
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        'user error',
        'user message',
        titleText: const Text('Registration Failed',
            style: TextStyle(color: Colors.white)),
        messageText: Text('Something went wrong\n$e',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        'user error',
        'user message',
        titleText:
            const Text('Login Failed', style: TextStyle(color: Colors.white)),
        messageText: Text('Something went wrong\n$e',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  logout() async {
    await _auth.signOut();
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      Get.snackbar(
        'google signin error',
        'error message',
        titleText: const Text(
          'Google Sign in Failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          'Something went wrong\n$e',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
