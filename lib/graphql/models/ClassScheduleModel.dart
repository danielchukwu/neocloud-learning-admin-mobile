import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';

class DateSelection {
  final int _year;
  final int _month;
  final int _day;
  
  DateSelection({required int year, required int month, required int day}) : _year = year, _month = month, _day = day;

  static bool compareDateSelection(DateSelection ds1, DateSelection ds2) {
    return ds1._year == ds2._year && ds1._month == ds2._month && ds1._day == ds2._day; 
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