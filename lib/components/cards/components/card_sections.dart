import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

// This displays a <label and a title - in a column> more if we want
// It takes in a a List containing Maps that hold the data to be displayed
// e.g
// [
//  {"label": "...", "title": "...", "flex": 1},
//  {"label": "...", "title": "...", "flex": 1}
// ]

class CardSections extends StatelessWidget {
  const CardSections({
    super.key,
    required this.data,
  });

  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(data.length, (index) {
          if (index == 0) {
            return Expanded(
              flex: data[index]["flex"],
              child: buildCardSection(index),
            );
          }
          return Expanded(
            flex: data[index]["flex"],
            child: Row(
              children: <Widget>[
                // Seperator
                Seperator(),
                // Card Section
                buildCardSection(index),
              ],
            ),
          );
        })
    );
  }

  Column buildCardSection(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Course Label
        TextMedium(
          title: data[index]["label"],
          color: kBlack70,
          weight: FontWeight.w500,
        ),
        // Course Title
        TextCustomMaxLine(
          title: data[index]["title"],
          fontSize: defaultSize * 1.6,
          color: kBlack70,
        ),
      ],
    );
  }
}

class Seperator extends StatelessWidget {
  const Seperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 4,
      width: defaultSize * .2,
      color: kBlack50,
    );
  }
}
