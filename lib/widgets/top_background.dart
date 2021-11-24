import 'package:flutter/material.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({
    Key? key,
    required this.w,
    required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: w,
          height: h * 0.36,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signup.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: w * 0.38,
          child: Image.asset(
            'assets/images/profile1.png',
            width: w * 0.25,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
