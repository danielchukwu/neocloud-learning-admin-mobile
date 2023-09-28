// : (){} "" <> ? _ ! *
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';

class UserEntity {
  final String ? id;
  final String ? name;
  final String ? avatar;
  final String ? cover;
  final String ? email;
  final String ? bio;
  final String ? phone;
  final RoleModel ? role;
  
  UserEntity({
    this.id,
    this.name,
    this.avatar,
    this.cover,
    this.email,
    this.bio,
    this.phone,
    this.role,
  });
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