import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassworkModel {
  final String id;
  final String title;
  final String body;
  final String? deadline;
  final ClassScheduleModel? classSchedule;
  final ClassModel? clas;
  final FacultyModel? faculty;
  // clas: User!

  ClassworkModel({
    required this.id,
    required this.title,
    required this.body,
    this.deadline,
    this.classSchedule,
    this.clas,
    this.faculty,
  });

  static ClassworkModel fromMap({required Map cw}) => ClassworkModel(
        id: cw['_id'],
        title: cw['title'],
        body: cw['body'],
        deadline: cw['deadline'],
        classSchedule: cw.containsKey('classSchedule') ? ClassScheduleModel.fromMap(cs: cw['classSchedule']) : null,
        clas: cw.containsKey('class') ? ClassModel.fromMap(aClass: cw['class']) : null,
        faculty: cw.containsKey('faculty') ? FacultyModel.fromMap(faculty: cw['faculty']) : null,
      );
}

// educators: List.generate(
//               cw['class']['educators'].length,
//               (index) => UserModel(
//                   id: cw['class']['educators'][index]['_id'],
//                   name: cw['class']['educators'][index]['name'],
//                   avatar: cw['class']['educators'][index]['avatar'])).toList(),


// query ExampleQuerys($limit: Int) {
//   classworks(limit: $limit) {
//     _id
//     title
//     body
//     deadline
//     class {
//       _id
//       name
//       educators {
//         _id
//         avatar
//         name
//       }
//     }
//     classSchedule {
//       _id
//       title
//       classModule {
//         _id
//         title
//         order
//       }
//     }
//     faculty {
//       _id
//       name
//     }
//   }
// }