import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/services/class_schedule_service.dart';
import 'package:neocloud_mobile/models/ClassSchedule.dart';

class ClassSchedulesList extends StatefulWidget {
  const ClassSchedulesList({super.key});
  @override
  State<ClassSchedulesList> createState() => _ClassSchedulesListState();
}

class _ClassSchedulesListState extends State<ClassSchedulesList> {
  var classSchedule = ClassScheduleService();
  List<ClassScheduleModel>? csList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    classSchedule.getClassSchedules().then((cs) {
      setState(() {
        csList = cs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return csList == null
        ? Center(child: CircularProgressIndicator())
        : csList!.isEmpty
            ? Center(child: Text('No Class Schedules Found'))
            : Column(
      children: List.generate(
        csList!.length,
        // (index) => ListTile(title: Text('It worked'),),
        (index) => ClassScheduleCard(
          classSchedule: csList![index],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: List.generate(widget.classScheduleList.length,
  //         (index) => ClassScheduleCard(clas: widget.classScheduleList[index])),
  //   );
  // }
}
