import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/auth_controller.dart';
import 'package:getx_app/utils/constants.dart';
import 'package:getx_app/widgets/auth_rich_text.dart';
import 'package:getx_app/widgets/custom_button.dart';
import 'package:getx_app/widgets/custom_text_field.dart';
import 'package:getx_app/widgets/social_media_registration.dart';
import 'package:getx_app/widgets/top_background.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  List images = ['f.png', 'g.png', 't.png'];
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
            TopBackground(w: w, h: h),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: marginHorizontal,
                vertical: marginVertical / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registration',
                    style: bigTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Register with your account',
                    style: smallTextStyle,
                  ),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  CustomButton(
                    onPressed: () {
                      AuthController.instance.register(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    label: 'Register',
                  ),
                  AuthRichText(
                    label1: 'Already have an account?',
                    label2: 'Login',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    height: h * 0.08,
                  ),
                  SocialMediaRegistration(h: h, images: images),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
