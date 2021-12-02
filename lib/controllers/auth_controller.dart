import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_app/views/login_view.dart';
import 'package:getx_app/views/welcome_view.dart';

class AuthController extends GetxController {
  final AuthController instance = Get.find();

  late Rx<User?> _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = _auth.currentUser as Rx<User?>;
    _user.bindStream(_auth.userChanges()); // Listen to changes on user state
    ever(_user, _startScreen);
  }

  _startScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginView());
    } else {
      Get.offAll(() => const WelcomeView());
    }
  }

  register(String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
