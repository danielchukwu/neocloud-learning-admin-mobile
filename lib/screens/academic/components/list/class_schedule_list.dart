import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassRoutineList extends StatelessWidget {
  const ClassRoutineList({
    super.key,
    required this.data,
  });

  final List<ClassSchedule> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(data.length, (index) => ClassScheduleCard(data: data[index]))
        );
  }
}