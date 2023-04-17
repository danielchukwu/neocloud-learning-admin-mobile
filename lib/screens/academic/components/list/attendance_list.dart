import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/attendance_card.dart';
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
          children: List.generate(data.length, (index) => AttendanceCard(data: data[index])),
        );
  }
}