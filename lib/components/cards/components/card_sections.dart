import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/seperator.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/utils/utils.dart';

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
    this.showLabel = true,
    this.showSeperator = true,
    this.centralize = false,
    this.textOverflowLimit = 15,
    // this.labelFontWeight = FontWeight.w500,
    // this.labelFontWeight = FontWeight.w400,
  });

  final List<Map> data;
  final bool showLabel;
  final bool showSeperator;
  final bool centralize;
  final int textOverflowLimit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(data.length, (index) {
        return Expanded(
          flex: data[index]["flex"],
          child: Row(
            children: <Widget>[
              // Seperator
              index > 0 && showSeperator
                  ? Seperator(
                      height: showLabel ? 40 : 21,
                    )
                  : const SizedBox(),
              // Card Section
              centralize ? const Spacer() : const SizedBox(),
              !centralize && index > 0
                  ? const SizedBox(width: 20)
                  : const SizedBox(),
              buildCardSection(index),
              centralize ? const Spacer() : const SizedBox(),
            ],
          ),
        );
      }),
    );
  }

  Column buildCardSection(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Course Label
        showLabel
            ? TextMedium(
                title: shortenText(
                    text: '${data[index]["label"]}', limit: textOverflowLimit),
                color: kBlack70,
                weight: FontWeight.w500,
              )
            : const SizedBox(),
        // Course Title
        TextMedium(
          title: shortenText(
              text: '${data[index]["title"]}', limit: textOverflowLimit),
          color: kBlack70,
        ),
      ],
    );
  }
}
