import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class HeaderWithDropdown extends StatelessWidget {
  const HeaderWithDropdown({
    super.key,
    required this.title,
    required this.press,
    required this.showContent,
    this.fontSize,
    this.color,
    this.icon,
    this.iconColor,
    this.weight = FontWeight.w500,
  });
  final String title;
  final Function() press;
  final bool showContent;
  final IconData? icon;
  final double? fontSize;
  final Color? color;
  final Color? iconColor;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    double turns = showContent == true ? -.50 : 0;
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextCustom(
                title: title,
                color: color ?? kBlack80,
                fontSize: fontSize ?? defaultSize * 1.8,
                weight: weight,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: defaultSize * 3),
              child: AnimatedRotation(
                turns: turns,
                duration: Duration(milliseconds: 100),
                child: Icon(icon ?? Icons.arrow_drop_up, color: iconColor ?? kBlack70),
                // child: Icon(Icons.arrow_drop_down_sharp, color: kBlack70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
