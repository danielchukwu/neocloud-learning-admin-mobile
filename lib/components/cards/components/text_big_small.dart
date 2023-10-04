import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class TextBigSmall extends StatelessWidget {
  TextBigSmall({
    Key? key, 
    required this.bigText, 
    required this.smallText,
    this.bigTextSize = 16,
    this.bigTextWeight = FontWeight.w600,
    this.bigTextColor = Colors.black,
    this.smallTextSize = 16,
    this.smallTextWeight = FontWeight.w400,
    this.smallTextColor,

  }) : super(key: key);

  final double bigTextSize;
  final FontWeight bigTextWeight;
  final double smallTextSize;
  final FontWeight smallTextWeight;
  late Color ? bigTextColor;
  late Color ? smallTextColor;

  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    bigTextColor ??= Theme.of(context).canvasColor.withOpacity(.9);
    smallTextColor ??= Theme.of(context).canvasColor.withOpacity(.8);

    return RichText(
      text: TextSpan(
        style: appsTextStyle(
          fontWeight: bigTextWeight,
          fontSize: bigTextSize,
          color: bigTextColor!
        ),
        children: [
          TextSpan(text: bigText),
          TextSpan(
            text: ' $smallText',
            style: appsTextStyle(
                fontWeight: smallTextWeight, fontSize: smallTextSize, color: smallTextColor!),
          ),
        ],
      ),
    );
  }
}
