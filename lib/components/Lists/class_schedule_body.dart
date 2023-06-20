import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/models/ClassSchedule.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

class ClassSchedulesList extends StatelessWidget {
  const ClassSchedulesList({super.key, required this.classScheduleList});

  final List<ClassSchedule> classScheduleList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(classScheduleList.length,
          (index) => ClassScheduleCard(clas: classScheduleList[index])),
    );
  }
}
