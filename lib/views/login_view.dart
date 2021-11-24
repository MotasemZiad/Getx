import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/constants.dart';
import 'package:getx_app/views/registration_view.dart';
import 'package:getx_app/views/welcome_view.dart';
import 'package:getx_app/widgets/custom_button.dart';
import 'package:getx_app/widgets/custom_text_field.dart';
import 'package:getx_app/widgets/auth_rich_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: w,
              height: h * 0.36,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_img.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: marginHorizontal,
                vertical: marginVertical / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back',
                    style: bigTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Login with your account',
                    style: smallTextStyle,
                  ),
                  SizedBox(height: h * 0.07),
                  CustomTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forget your password?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.to(() => const WelcomeView());
                    },
                    label: 'Login',
                  ),
                  SizedBox(
                    height: h * 0.14,
                  ),
                  AuthRichText(
                    label1: 'Don\'t have an account?',
                    label2: 'Create one',
                    onTap: () {
                      Get.to(() => const RegistrationView());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
