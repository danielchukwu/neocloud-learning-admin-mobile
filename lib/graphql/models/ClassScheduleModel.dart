import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';

class ClassScheduleModel {
  final String id;
  final String title;
  final String? description;
  final String? date;
  final int? order;
  final String? startTime;
  final String? endTime;
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
    date: cs['date'],
    order: cs['order'],
    startTime: cs['startTime'],
    endTime: cs['endTime'],
    classwork: cs.containsKey('classwork') ? ClassworkModel.fromMap(cw: cs['classwork']) : null,
    classModule: cs.containsKey('classModule') ? ClassModuleModel.fromMap(classModule: cs['classModule']) : null,
  );

  static ClassScheduleModel fromInstance({required ClassScheduleModel cs, String? title, String? description, ClassworkModel? classwork}) => ClassScheduleModel(
    id: cs.id,
    title: title ?? cs.title,
    description: description ?? cs.description,
    date: cs.date,
    order: cs.order,
    startTime: cs.startTime,
    endTime: cs.endTime,
    classwork: classwork ?? cs.classwork,
    classModule: cs.classModule
  );
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