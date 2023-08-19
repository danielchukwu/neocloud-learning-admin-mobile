import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/services/class_schedule_service.dart';

import '../widgets.dart';

class ClassSchedulesList extends StatefulWidget {
  const ClassSchedulesList({super.key, this.classScheduleList, this.spinnerScreeMaxHeight});

  final List<ClassScheduleModel>? classScheduleList;
  final double? spinnerScreeMaxHeight;

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
        ? spinnerScreen(screenMaxHeight: widget.spinnerScreeMaxHeight)
        : dataList!.isEmpty
            ? nothingWasFoundScreen(screenMaxHeight: widget.spinnerScreeMaxHeight)
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
