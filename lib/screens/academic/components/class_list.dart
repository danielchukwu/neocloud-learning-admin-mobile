import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    super.key,
    required this.data,
  });

  final List<Class> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Add Class Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Class", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => ClassCard(data: data[index])),
        ),

      ],
    );
  }
}