import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/label_text.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class AcademicCourseCard extends StatelessWidget {
  const AcademicCourseCard({
    super.key,
    required this.data,
  });

  final AccademicCourse data;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: cardBottomMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Into
          CardHeader(label: "Class", title: data.clas),

          // Course
          buildLabelAndText(label: "Course", text: data.course),
        ],
      ),
    );
  }
}