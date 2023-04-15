import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.label,
    required this.title,
    this.labelSize = 16,
    this.textSize  = 22,
    this.labelWeight = FontWeight.w600,
    this.textWeight = FontWeight.w500,
  });

  final String label;
  final String title;
  final double labelSize;
  final double textSize;
  final FontWeight labelWeight;
  final FontWeight textWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Card Label
        TextCustomMaxLine(
          title: label,
          fontSize: labelSize,
          color: kBlack70,
          weight: labelWeight,
        ),

        // Card Title
        TextCustomMaxLine(
          title: title,
          fontSize: textSize,
          color: kBlack80,
          weight: textWeight,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}