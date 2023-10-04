// : (){} "" <> ? _ ! *
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/constants/constants.dart';
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';

class UserModel {
  final String id;
  final String name;
  final String avatar;
  final String? cover;
  final String? email;
  final String? bio;
  final String? phone;
  final RoleModel? role;
  
  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    this.cover,
    this.email,
    this.bio,
    this.phone,
    this.role,
  });

  static UserModel fromMap({required Map user}) => UserModel(
    id: user['_id'],
    name: user['name'],
    email:  user['email'],
    avatar: _keyValueIsPresent(user, 'avatar') ? user['avatar'] : defaultProfileAvatar,
    cover: _keyValueIsPresent(user, 'cover') ? user['cover'] : defaultProfileCover,
    bio: user['bio'],
    phone: user['phone'],
    role: _keyValueIsPresent(user, 'role') ? RoleModel.fromMap(role: user['role']) : null,
  );

  static UserModel fromMapEssentials({required Map user}) => UserModel(
    id: user['_id'],
    name: user['name'],
    avatar: _keyValueIsPresent(user, 'avatar') ? user['avatar'] : defaultProfileAvatar,
  );

  static bool _keyValueIsPresent(Map map, String key) {
    if (map.containsKey(key)) {
      if (map[key] != null) {
        return true;
      }
    }
    return false;
  }
}


// query Query($name: String, $limit: Int) {
//   users(name: $name, limit: $limit) {
//     _id
//     name
//     bio
//     avatar
//     cover
//     email
//     phone
//     role {
//       _id
//       name
//     }
//   }
// }