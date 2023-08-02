import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/services/class_schedule_service.dart';
import 'package:neocloud_mobile/models/ClassSchedule.dart';

class ClassSchedulesList extends StatefulWidget {
  const ClassSchedulesList({super.key, this.classScheduleList});

  final List<ClassScheduleModel>? classScheduleList;

  @override
  State<ClassSchedulesList> createState() => _ClassSchedulesListState();
}

class _ClassSchedulesListState extends State<ClassSchedulesList> {
  var classSchedule = ClassScheduleService();
  List<ClassScheduleModel>? dataList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (!mounted) return;

    if (widget.classScheduleList == null) {
      classSchedule.getClassSchedules().then((cs) {
        setState(() { dataList = cs; });
      });
    } else {
      dataList = widget.classScheduleList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return dataList == null
        ? Center(child: CircularProgressIndicator())
        : dataList!.isEmpty
            ? Center(child: Text('No Class Schedules Found'))
            : Column(
                children: List.generate(
                  dataList!.length,
                  // (index) => ListTile(title: Text('It worked'),),
                  (index) => ClassScheduleCard(
                    classSchedule: dataList![index],
                  ),
                ),
              );
  }
}
