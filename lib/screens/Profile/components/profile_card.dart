import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';


class ProfileCard extends StatelessWidget {
  ProfileCard({
    super.key,
    required this.title,
    required this.count,
    required this.press,
    this.bgColor,
    this.boxHeight = 70,
    this.borderRadius = 10,
  });

  final String title;
  final int count;
  final Function() press;
  late Color ? bgColor;
  final double boxHeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    bgColor ??= Theme.of(context).canvasColor;

    return Expanded(
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: boxHeight,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextMedium(title: title, color: getColorOpposite(Theme.of(context).canvasColor), weight: FontWeight.w600),
              TextSmall(title: "$count", color: getColorOpposite(Theme.of(context).canvasColor))
            ],
          ),
        ),
      ),
    );
  }
}