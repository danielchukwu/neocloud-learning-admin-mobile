import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassSchedulesList extends StatelessWidget {
  const ClassSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(classScheduleList.length, (index) => ClassScheduleCard(clas: classScheduleList[index])),
    );
  }
}