import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class SettingsFormHeader extends StatelessWidget {
  const SettingsFormHeader({
    Key? key,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextExtraLarge(title: mainText, color: kBlack90, weight: FontWeight.w500),
        SizedBox(height: defaultSize),
        TextMedium(title: subText, color: kBlack60),
      ],
    );
  }
}