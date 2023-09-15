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
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: kBlack50, width: .2),
              bottom: BorderSide(color: kBlack50, width: .2))),
      child: Row(
        children: <Widget>[
          // Title
          const SizedBox(width: 20),
          InkWell(
              onTap: () => pressLeft(),
              child: TextLarge(
                title: title,
                weight: FontWeight.w700,
                color: selectedLeft ? kBlack80 : kBlack50,
              )),

          // Count
          const Spacer(),

          InkWell(
            onTap: () => pressRight(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: selectedLeft ? kBlack.withOpacity(.05) : kBlack80,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: Column(
                children: [
                  const Spacer(),
                  TextLarge(
                    title: rightText,
                    color: selectedLeft ? kBlack50 : kWhite,
                    weight: FontWeight.w500,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
