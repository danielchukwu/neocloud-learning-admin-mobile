import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';


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

  static ClassModuleModel fromInstance({required ClassModuleModel module, String? title}) => ClassModuleModel(
    id: module.id,
    title: title ?? module.title,
    order: module.order,
    clas: module.clas,
    classSchedules: module.classSchedules,
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