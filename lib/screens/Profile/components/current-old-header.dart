import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class CurrentOldHeader extends StatelessWidget {
  const CurrentOldHeader({
    super.key,
    required this.pressRight,
    required this.pressLeft,
    required this.title,
    required this.rightText,
    required this.selectedLeft,
  });

  final String title;
  final String rightText;
  final Function() pressLeft;
  final Function() pressRight;
  final bool selectedLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultSize),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: kBlack50, width: .2),
              bottom: BorderSide(color: kBlack50, width: .2))),
      child: Row(
        children: <Widget>[
          // Title
          SizedBox(width: defaultSize * 2),
          InkWell(
              onTap: () => pressLeft(),
              child: TextLarge(
                title: title,
                weight: FontWeight.w700,
                color: selectedLeft ? kBlack80 : kBlack50,
              )),

          // Count
          Spacer(),

          InkWell(
            onTap: () => pressRight(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.5),
              bottomLeft: Radius.circular(defaultSize * 1.5),
            ),
            child: Container(
              width: defaultSize * 10,
              height: defaultSize * 4,
              decoration: BoxDecoration(
                  color: selectedLeft ? kBlack.withOpacity(.05) : kBlack80,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultSize * 1.5),
                      bottomLeft: Radius.circular(defaultSize * 1.5))),
              child: Column(
                children: [
                  Spacer(),
                  TextLarge(
                    title: rightText,
                    color: selectedLeft ? kBlack50 : kWhite,
                    weight: FontWeight.w500,
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
