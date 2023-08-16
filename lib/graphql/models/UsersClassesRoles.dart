import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class usersClassesRolesModel {
  final String id;
  final UserModel user;
  final ClassModel clas;
  final RoleModel role;
  // clas: User!

  usersClassesRolesModel({
    required this.id,
    required this.clas,
    required this.role,
    required this.user,
  });

  static usersClassesRolesModel fromMap({required Map ucr}) => usersClassesRolesModel(
    id: ucr['_id'],
    user: UserModel(
      id: ucr['user']['_id'],
      name: ucr['user']['name'],
      avatar: ucr['user']['avatar'] ?? defaultProfileAvatar,
      cover: ucr['user']['cover'] ?? defaultProfileCover
    ),
    clas: ClassModel(
      id: ucr['class']['_id'],
      name: ucr['class']['name'],
    ),
    role: RoleModel(
      id: ucr['role']['_id'],
      name: ucr['role']['name'],
    ),
  );
}

// query Query($limit: Int) {
//   usersClassesRoles(limit: $limit) {
//     _id
//     class {
//       _id
//       name
//     }
//     role {
//       _id
//       name
//     }
//     user {
//       _id
//       name
//     }
//   }
// }