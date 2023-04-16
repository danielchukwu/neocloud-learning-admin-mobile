import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/syllabus_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class SyllabusList extends StatelessWidget {
  const SyllabusList({
    super.key,
    required this.data,
  });

  final List<Syllabus> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Add Syllabus Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Syllabus", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => SyllabusCard(data: data[index])),
        ),

      ],
    );
  }
}