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
        SizedBox(height: defaultSize * 1.5),
        Text(label, style: Theme.of(context).textTheme.bodyMedium,),

        // Content
        SizedBox(height: defaultSize * .5),
        Text(content, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}