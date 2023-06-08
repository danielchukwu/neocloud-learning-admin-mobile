import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class TextBigSmall extends StatelessWidget {
  const TextBigSmall({Key? key, required this.bigText, required this.smallText,}) : super(key: key);

  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: getAppsTextStyle(
          fontWeight: FontWeight.w200,
          fontSize: defaultSize * 4,
        ),
        children: [
          TextSpan(text: bigText),
          TextSpan(
            text: ' $smallText',
            style: getAppsTextStyle(
                fontWeight: FontWeight.w600, fontSize: defaultSize * 1.6),
          ),
        ],
      ),
    );
  }
}
