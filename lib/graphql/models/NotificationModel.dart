import 'package:neocloud_mobile/graphql/models/ClassInstanceModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/NotificationType.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class NotificationModel {
  final String id;
  final String body;
  final NotificationTypeModel notificationType;
  final UserModel user;
  final ClassInstanceModel? classInstance;
  final ClassworkModel? classwork;
  final FacultyModel? faculty;
  // clas: User!

  NotificationModel({
    required this.id,
    required this.notificationType,
    required this.user,
    required this.body,
    this.classInstance,
    this.classwork,
    this.faculty,
  });

  static NotificationModel fromMap({required Map n}) => NotificationModel(
        id: n['_id'],
        body: n['body'],
        notificationType: NotificationTypeModel.fromMap(nt: n['notificationType']),
        user: UserModel.fromMap(user: n['user']),
        classInstance: n.containsKey('classInstance') ? ClassInstanceModel.fromMap(ci: n['classInstance']) : null,
        classwork: n.containsKey('classwork') ? ClassworkModel.fromMap(cw: n['classwork']) : null,
        faculty: n.containsKey('faculty') ? FacultyModel.fromMap(faculty: n['faculty']) : null
      );
}

// query Query($limit: Int) {
//   notifications(limit: $limit) {
//     _id
//     body
//     classInstance {
//       _id
//       isCompleted
//       class {
//         _id
//         name
//       }
//     }
//     classwork {
//       _id
//       title
//       body
//     }
//     faculty {
//       _id
//       name
//     }
//     notificationType {
//       _id
//       name
//     }
//     user {
//       _id
//       avatar
//       name
//     }
//   }
// }