import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
    required this.label,
    required this.content,
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        const SizedBox(height: 15),
        TextMedium(title: label, color: kBlack70),

        // Content
        const SizedBox(height: 5),
        TextMedium(
          title: content,
          color: kBlack70,
        ),
      ],
    );
  }
}