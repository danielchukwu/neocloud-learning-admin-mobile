import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';

class DateSelection {
  final int year;
  final int month;
  final int day;
  
  DateSelection({required this.year, required this.month, required this.day});

  static bool compareDateSelection(DateSelection ds1, DateSelection ds2) {
    return ds1.year == ds2.year && ds1.month == ds2.month && ds1.day == ds2.day; 
  }
}

class MyTimeOfDay extends TimeOfDay {
  const MyTimeOfDay({required super.hour, required super.minute, required this.isAm});
  
  final bool isAm;

  get convertToString => '$hour:$minute:${isAm ? 'am' : 'pm'}';

  static MyTimeOfDay fromInstance({required MyTimeOfDay t, int? hour, int? minute, bool? isAm}) {
    return MyTimeOfDay(
      hour: hour ?? t.hour, 
      minute: minute ?? t.minute, 
      isAm: isAm ?? t.isAm, 
    );
  }
}

class DayandTime {
  DayandTime({
    required this.weekday,
    required this.title,
    this.startTime,
    this.endTime,
  });

  final int weekday;
  final String title;
  MyTimeOfDay? startTime;
  MyTimeOfDay? endTime;

  static List<DayandTime> sort(List<DayandTime> list) {
    if (list.length == 1) return list;
    int mid = (list.length / 2).floor();
    var left = list.sublist(0, mid);
    var right = list.sublist(mid);
    
    return _merge(sort(left), sort(right));
  }

  static List<DayandTime> _merge(List<DayandTime> left, List<DayandTime> right) {
    final List<DayandTime> result = [];

    int leftIndex = 0;
    int rightIndex = 0;

    while (leftIndex < left.length && rightIndex < right.length) {
      if (left[leftIndex].weekday <  right[rightIndex].weekday){
        result.add(left[leftIndex]);
        leftIndex++;
      } else {
        result.add(right[rightIndex]);
        rightIndex++;
      }
    }

    result.addAll(left.sublist(leftIndex));
    result.addAll(right.sublist(rightIndex));

    return result;
  }
}


class ClassScheduleModel {
  final String id;
  final String title;
  final String? description;
  final DateSelection? date;
  final int? order;
  final MyTimeOfDay? startTime;
  final MyTimeOfDay? endTime;
  final ClassworkModel? classwork;
  final ClassModuleModel? classModule;

  ClassScheduleModel({
    required this.id,
    required this.title,
    this.description,
    this.date,
    this.order,
    this.startTime,
    this.endTime,
    this.classwork,
    this.classModule
  });

  static ClassScheduleModel fromMap({required Map cs}) => ClassScheduleModel(
    id: cs['_id'],
    title: cs['title'],
    description: cs['description'],
    // TODO: implement date selection conversion
    // date: cs['date'],
    order: cs['order'],
    startTime: cs['startTime'],
    endTime: cs['endTime'],
    classwork: cs.containsKey('classwork') ? ClassworkModel.fromMap(cw: cs['classwork']) : null,
    classModule: cs.containsKey('classModule') ? ClassModuleModel.fromMap(classModule: cs['classModule']) : null,
  );

  static ClassScheduleModel fromInstance({
    required ClassScheduleModel cs, 
    String? title, 
    String? description, 
    DateSelection? dateSelection,
    ClassworkModel? classwork,
    MyTimeOfDay? startTime,
    MyTimeOfDay? endTime,
  }) => ClassScheduleModel(
    id: cs.id,
    title: title ?? cs.title,
    description: description ?? cs.description,
    date: dateSelection ?? cs.date,
    order: cs.order,
    startTime: startTime ?? cs.startTime,
    endTime: endTime ?? cs.endTime,
    classwork: classwork ?? cs.classwork,
    classModule: cs.classModule
  );

  bool dateAndTimeIsPresent() {
    return date != null && startTime != null && endTime != null;
  }
}

// query Query {
//   classSchedules {
//     _id
//     order
//     title
//     description
//     date
//     startTime
//     endTime
//     classModule {
//       _id
//       title
//     }
//   }
// }