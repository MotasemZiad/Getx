import 'package:flutter/material.dart';

class SocialMediaRegistration extends StatelessWidget {
  const SocialMediaRegistration({
    Key? key,
    required this.h,
    required this.images,
  }) : super(key: key);

  final double h;
  final List images;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Register using one of the following',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: h * 0.01,
        ),
        Wrap(
          spacing: 10.0,
          alignment: WrapAlignment.center,
          children: List.generate(
            3,
            (index) => CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/${images[index]}'),
            ),
          ),
        ),
      ],
    );
  }
}
