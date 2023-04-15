import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/attendance_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({
    super.key,
    required this.data,
  });

  final List<Attendance> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Take Attendance Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Take Attendance", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => AttendanceCard(data: data[index])),
        ),

      ],
    );
  }
}