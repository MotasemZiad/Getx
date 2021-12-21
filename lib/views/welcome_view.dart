import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/auth_controller.dart';
import 'package:getx_app/utils/constants.dart';
import 'package:getx_app/widgets/custom_button.dart';
import 'package:getx_app/widgets/top_background.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key, required this.email}) : super(key: key);
  final String email;
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
                vertical: marginVertical,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You are Welcome',
                    style: bigTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    email,
                    style: smallTextStyle,
                  ),
                  SizedBox(
                    height: h * 0.2,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Logout'),
                          titleTextStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          content:
                              const Text('Are you sure you want to logout?'),
                          elevation: 6.0,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  AuthController.instance.logout();
                                },
                                child: const Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('No')),
                          ],
                        ),
                        transitionCurve: Curves.easeInOut,
                      );
                    },
                    label: 'Logout',
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
