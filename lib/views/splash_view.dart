import 'package:flutter/material.dart';
import 'package:getx_app/utils/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView(Key? key) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        backgroundColor: primaryColor,
      )),
    );
  }
}
