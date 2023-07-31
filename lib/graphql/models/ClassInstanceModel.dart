import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassInstanceModel {
  final String id;
  final bool isCompleted;
  final ClassModel clas;
  final UserModel? educator;

  ClassInstanceModel({
    required this.id,
    required this.isCompleted,
    required this.clas,
    this.educator,
  });

  static ClassInstanceModel fromMap({required Map ci}) => ClassInstanceModel(
    id: ci['_id'],
    isCompleted: ci['isCompleted'],
    clas: ClassModel.fromMap(aClass: ci['class']),
    educator: ci.containsKey('educator') ? UserModel.fromMap(user: ci['educator']) : null,
  );
}

// query ClassInstances($limit: Int) {
//   classInstances(limit: $limit) {
//     _id
//     isCompleted
//     class {
//       _id
//       name
//     }
//     educator {
//       _id
//       name
//     }
//   }
// }