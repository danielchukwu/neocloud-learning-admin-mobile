import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassModuleModel {
  final String id;
  final String title;
  final int? order;
  final List<ClassScheduleModel>? classSchedules;
  final ClassModel? clas;

  ClassModuleModel({
    required this.id,
    required this.title,
    this.order,
    this.classSchedules,
    this.clas
  });

  static ClassModuleModel fromMap({required Map classModule}) => ClassModuleModel(
    id: classModule['_id'],
    title: classModule['title'],
    order: classModule['order'],
    clas: classModule.containsKey('class') ? ClassModel.fromMap(aClass: classModule['class']) : null,
    classSchedules: classModule.containsKey('classSchedules')
    ? List.generate(classModule['classSchedules'].length, (index) =>  ClassScheduleModel.fromMap(cs: classModule['classSchedules'][index]),).toList() 
    : null,
  );
}

// query ExampleQuery(\$classId: ID) {
//   classModules(classId: \$classId) {
//     _id
//     title
//     order
//     classSchedules {
//       _id
//       title
//       description
//       date
//       order
//       startTime
//       endTime
//     }
//     class {
//       _id
//       avatar
//       name
//     }
//   }
// }