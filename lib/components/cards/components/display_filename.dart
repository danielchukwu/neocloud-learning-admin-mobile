import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class DisplayFileName extends StatelessWidget {
  const DisplayFileName({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultSize * 1.5, horizontal: defaultSize * 1.5),
          decoration: BoxDecoration(
            color: kBlack.withOpacity(.1),
            // borderRadius: BorderRadius.circular(defaultSize * .5),
          ),
          child: TextCustomMaxLine(
            title: title,
            fontSize: defaultSize * 1.6,
            weight: FontWeight.w600,
            color: kBlack50,
          ),
        ),
      )
    ]);
  }
}
