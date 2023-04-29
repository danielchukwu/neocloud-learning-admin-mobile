import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class SettingsFormHeader extends StatelessWidget {
  const SettingsFormHeader({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextExtraLarge(title: title, color: kBlack90, weight: FontWeight.w500),
        subTitle.isNotEmpty ? SizedBox(height: defaultSize) : SizedBox(),
        TextMedium(title: subTitle, color: kBlack60),
      ],
    );
  }
}