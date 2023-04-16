import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: label + ":  ", style: getAppsTextStyle(fontWeight: FontWeight.w400, color: kBlack70)),
        TextSpan(text: text, style: getAppsTextStyle(fontWeight: FontWeight.w600, color: kBlack70)),
      ]),
    );
  }
}
