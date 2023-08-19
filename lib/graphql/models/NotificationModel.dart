import 'package:neocloud_mobile/graphql/models/ClassInstanceModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/NotificationType.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/utils/utils.dart';
// : (){} "" <> ? _ ! *

class NotificationModel {
  final String id;
  final String body;
  bool seen;
  final NotificationTypeModel type;
  final UserModel user;
  final ClassInstanceModel? classInstance;
  final ClassworkModel? classwork;
  final FacultyModel? faculty;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.type,
    required this.user,
    required this.body,
    required this.seen,
    required this.createdAt,
    this.classInstance,
    this.classwork,
    this.faculty,
  });

  static NotificationModel fromMap({required Map n, bool? seen}) => NotificationModel(
        id: n['_id'],
        body: n['body'],
        seen: seen ?? n['seen'],
        type: NotificationTypeModel.fromMap(nt: n['type']),
        user: UserModel.fromMapEssentials(user: n['user']),
        createdAt: convertToDateTime(n['createdAt']),
        // classInstance: n.containsKey('classInstance') ? ClassInstanceModel.fromMap(ci: n['classInstance']) : null,
        // classwork: n.containsKey('classwork') ? ClassworkModel.fromMap(cw: n['classwork']) : null,
        // faculty: n.containsKey('faculty') ? FacultyModel.fromMap(faculty: n['faculty']) : null
      );
}

// query Query(\$limit: Int) {
//   notifications(limit: \$limit) {
//     _id
//     body
//     seen
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
//     }
//     faculty {
//       _id
//       name
//     }
//     type {
//       _id
//       name
//     }
//     user {
//       _id
//       avatar
//       name
//     }
//     createdAt
//   }
// }