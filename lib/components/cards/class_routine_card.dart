import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassRoutineCard extends StatelessWidget {
  const ClassRoutineCard({
    super.key,
    required this.data,
  });

  final ClassRoutine data;

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
    final subjectAndTeacher = [
      {"label": "Subject", "title": data.subject, "flex": 1},
      {"label": "Teacher", "title": data.educator,   "flex": 1},
    ];

    final sections = [
      {"label": "Starts", "title": data.startTime, "flex": 1},
      {"label": "Ends",   "title": data.endTime,   "flex": 1},
      {"label": "Date",   "title": data.createdAt, "flex": 1},
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

          // Subject and Teacher
          SizedBox(height: defaultSize * 1.5),
          CardSections(data: subjectAndTeacher, showLabel: true, showSeperator: false),

          // Dates
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections, showLabel: true, textOverflowLimit: 7),
        ],
      ),
    );
  }
}