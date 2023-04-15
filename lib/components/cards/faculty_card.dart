import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class FacultyCard extends StatelessWidget {
  const FacultyCard({
    super.key,
    required this.data,
  });

  final Faculty data;

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
    final sections = [
      {"label": "Head of Faculty", "title": data.hod, "flex": 1},
      {"label": "Students", "title": data.studentsCount, "flex": 1},
    ];
    List<String> facultyList = data.faculty.split(" ");

    String smallText = facultyList.length > 1 ? ' ' + facultyList.sublist(1,).join(' ') : '';
    String bigText = facultyList[0];

    return Container(
      margin: cardTopMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Into
          TextMedium(title: "Faculty", color: kBlack70, weight: FontWeight.w500),

          // Student count
          SizedBox(height: defaultSize * .5),
          TextBigSmall(
            bigText: bigText,
            smallText: smallText,
          ),

          // Dates
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections, showLabel: true, showSeperator: false),
        ],
      ),
    );
  }
}
