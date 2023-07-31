import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class AttendanceModel {
  final String id;
  final ClassModel clas;
  final UserModel user;
  final ClassScheduleModel classSchedule;
  // clas: User!

  AttendanceModel({
    required this.id,
    required this.clas,
    required this.classSchedule,
    required this.user,
  });

  static AttendanceModel fromMap({required Map att}) => AttendanceModel(
    id: att['_id'],
    user: UserModel.fromMap(user: att['user']),
    clas: ClassModel.fromMap(aClass: att['class']),
    classSchedule: ClassScheduleModel.fromMap(cs: att['classSchedule']),
  );
}


// query ExampleQuerys($limit: Int) {
//   attendances(limit: $limit) {
//     _id
//     user {
//       _id
//       name
//     }
//     class {
//       _id
//       name
//     }
//     classSchedule {
//       _id
//       title
//     }
//   }
// }