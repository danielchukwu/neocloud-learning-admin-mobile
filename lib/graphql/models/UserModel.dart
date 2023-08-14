// : (){} "" <> ? _ ! *
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';

class UserModel {
  final String id;
  final String name;
  final String? email;
  final String? cover;
  final String? avatar;
  final String? bio;
  final String? phone;
  final RoleModel? role;
  
  UserModel({
    required this.id,
    required this.name,
    this.email,
    this.cover,
    this.avatar,
    this.bio,
    this.phone,
    this.role,
  });

  static UserModel fromMap({required Map user}) => UserModel(
    id: user['_id'],
    name: user['name'],
    email: user['email'],
    cover: user['cover'],
    avatar: user['avatar'],
    bio: user['bio'],
    phone: user['phone'],
    role: user.containsKey('role') && user['role'] != null ? RoleModel.fromMap(role: user['role']) : null,
  );
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