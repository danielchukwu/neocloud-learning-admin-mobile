import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class usersFacultiesRolesModel {
  final String id;
  final FacultyModel faculty;
  final RoleModel role;
  final UserModel user;
  // clas: User!

  usersFacultiesRolesModel({
    required this.id,
    required this.faculty,
    required this.role,
    required this.user,
  });

  static usersFacultiesRolesModel fromMap({required Map ufr}) => usersFacultiesRolesModel(
    id: ufr['_id'],
    user: UserModel(
      id: ufr['user']['_id'],
      name: ufr['user']['name'],
      avatar: ufr['user']['avatar'] ?? defaultProfileAvatar,
      cover: ufr['user']['cover'] ?? defaultProfileCover
    ),
    role: RoleModel(
      id: ufr['role']['_id'],
      name: ufr['role']['name'],
    ),
    faculty: FacultyModel(
      id: ufr['faculty']['_id'],
      name: ufr['faculty']['name'],
    ),
  );
}

// query Query {
//   usersFacultiesRoles {
//     _id
//     faculty {
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