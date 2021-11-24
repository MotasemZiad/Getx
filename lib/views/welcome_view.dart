import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/constants.dart';
import 'package:getx_app/views/registration_view.dart';
import 'package:getx_app/widgets/custom_button.dart';
import 'package:getx_app/widgets/top_background.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

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
                  const Text(
                    'test@gmail.com',
                    style: smallTextStyle,
                  ),
                  SizedBox(
                    height: h * 0.2,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.to(() => const RegistrationView());
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
