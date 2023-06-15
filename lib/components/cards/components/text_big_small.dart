import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class TextBigSmall extends StatelessWidget {
  const TextBigSmall({
    Key? key, 
    required this.bigText, 
    required this.smallText,
    this.bigTextSize = 16,
    this.bigTextWeight = FontWeight.w600,
    this.bigTextColor = Colors.black,
    this.smallTextSize = 16,
    this.smallTextWeight = FontWeight.w400,
    this.smallTextColor = Colors.black87,

  }) : super(key: key);

  final double bigTextSize;
  final FontWeight bigTextWeight;
  final double smallTextSize;
  final FontWeight smallTextWeight;
  final Color bigTextColor;
  final Color smallTextColor;

  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: getAppsTextStyle(
          fontWeight: bigTextWeight,
          fontSize: bigTextSize,
          color: bigTextColor
        ),
        children: [
          TextSpan(text: bigText),
          TextSpan(
            text: ' $smallText',
            style: getAppsTextStyle(
                fontWeight: smallTextWeight, fontSize: smallTextSize, color: smallTextColor),
          ),
        ],
      ),
    );
  }
}
