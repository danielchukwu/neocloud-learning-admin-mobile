import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class FacultyList extends StatelessWidget {
  const FacultyList({
    super.key,
    required this.data,
  });

  final List<Faculty> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Add Faculty Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Faculty", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => FacultyCard(data: data[index])),
        ),

      ],
    );
  }
}