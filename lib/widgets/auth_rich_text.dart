import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx_app/utils/constants.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    Key? key,
    required this.label1,
    required this.label2,
    required this.onTap,
  }) : super(key: key);

  final String label1;
  final String label2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label1,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
            const WidgetSpan(
              child: SizedBox(
                width: 6.0,
              ),
            ),
            TextSpan(
              text: label2,
              style: TextStyle(
                color: primaryDarkColor,
                decorationColor: primaryDarkColor,
                decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
