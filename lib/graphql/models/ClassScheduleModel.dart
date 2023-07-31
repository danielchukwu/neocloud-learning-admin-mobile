import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';

class ClassScheduleModel {
  final String id;
  final String title;
  final String? description;
  final String? date;
  final int? order;
  final String? startTime;
  final String? endTime;
  final ClassModuleModel? classModule;


  ClassScheduleModel({
    required this.id,
    required this.title,
    this.description,
    this.date,
    this.order,
    this.startTime,
    this.endTime,
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
    // classModule: ClassModuleModel(id: cs['classModule']['_id'], title: cs['classModule']['title'],)
    classModule: cs.containsKey('classModule') ? ClassModuleModel.fromMap(classModule: cs['classModule']) : null,
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