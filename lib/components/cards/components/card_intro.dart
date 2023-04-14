import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class CardIntro extends StatelessWidget {
  const CardIntro({
    super.key,
    required this.label,
    required this.title,
  });

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Card Label
        TextMedium(
          title: label,
          color: kBlack70,
          weight: FontWeight.w600,
        ),

        // Card Title
        TextCustomMaxLine(
          title: title,
          fontSize: defaultSize * 2.2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}