import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextExtraLarge(
            title: 'Welcome Back 👋',
            color: kBlue,
            weight: FontWeight.w600,
          ),
          TextMedium(
            title:
            'We are happy to see you again. To use your account you must first login.',
            textAlign: TextAlign.center,
            color: kBlack60,
          ),
        ],
      ),
    );
  }
}
