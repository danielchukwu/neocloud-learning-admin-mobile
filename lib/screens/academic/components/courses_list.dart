import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/courses_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({
    super.key,
    required this.data,
  });

  final List<Course> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Add Course Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Course", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => CoursesCard(data: data[index])),
        ),

      ],
    );
  }
}