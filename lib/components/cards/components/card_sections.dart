import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/seperator.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/utils.dart';

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
  final int  textOverflowLimit;

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
                      height: showLabel ? defaultSize * 4 : defaultSize * 2.1,
                    )
                  : SizedBox(),
              // Card Section
              centralize ? Spacer() : SizedBox(),
              !centralize && index > 0 ? SizedBox(width: defaultSize * 2) : SizedBox(),
              buildCardSection(index),
              centralize ? Spacer() : SizedBox(),

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
                title: shortenText(text: '${data[index]["label"]}', limit: textOverflowLimit),
                color: kBlack70,
                weight: FontWeight.w500,
              )
            : SizedBox(),
        // Course Title
        TextMedium(
          title: shortenText(text: '${data[index]["title"]}', limit: textOverflowLimit),
          color: kBlack70,
        ),
      ],
    );
  }
}
