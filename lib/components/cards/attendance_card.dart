import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Filters.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/utils.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    required this.data,
  });

  final Attendance data;

  @override
  Widget build(BuildContext context) {
    // The below list of objects get displayed side by side in the card
    // and we provide a flex to tell determine the amount of flex an item takes up
    // e.g
    // with label
    // Course          | Date
    // Software Deve.. | May 3
    // without label
    //   27  |  March  |  2023
    List<String> date =
        data.createdAt.split('-'); // 2022-04-11 -> ['2022', '04', '11'];
    final sections = [
      {"title": date[2], "flex": 1},
      {"title": monthsFilter[int.parse(date[1]) -1], "flex": 1},
      {"title": date[0], "flex": 1},
    ];

    return Container(
      margin: cardBottomMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Into
          CardHeader(label: "Class", title: data.clas),

          // Student count
          SizedBox(height: defaultSize * .5),
          TextBigSmall(
            bigText:
                '${data.attendance} ${getPluralOrSingular(count: data.attendance, word: "Student")}',
            smallText: '   Att.',
          ),

          // Dates
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections, showLabel: false, centralize: true),
        ],
      ),
    );
  }
}
