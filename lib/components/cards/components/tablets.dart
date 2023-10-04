import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';

class TextColorTablet extends StatelessWidget {
  TextColorTablet({
    super.key,
    required this.title,
    required this.bgColor,
    this.color,
  });

  final String title;
  late Color ? color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    color ??= Theme.of(context).canvasColor;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: defaultSize * .5, horizontal: defaultSize),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [bgColor, bgColor.withOpacity(.95)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(defaultSize * .5),
      ),
      child: TextSmall(
        title: title,
        color: color,
        weight: FontWeight.w500,
      ),
    );
  }
}
