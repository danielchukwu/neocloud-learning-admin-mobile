import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

/// This widget simply displays a column of an index text and a title text
class FormIndexTextAndTitleHeader extends StatelessWidget {
  const FormIndexTextAndTitleHeader({
    super.key,
    required this.indexText, // e.g Module 1 or Schedule 12 etc. A text then the index number
    required this.title,
  });

  final String indexText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Module Count
          const SizedBox(height: 20),
          TextSmall(title: indexText, weight: FontWeight.w600, color: Theme.of(context).canvasColor.withOpacity(.5),),
          
          // Module Title
          const SizedBox(height: 5),
          TextLarge(title: title, weight: FontWeight.w600, color: Theme.of(context).canvasColor.withOpacity(.8)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}