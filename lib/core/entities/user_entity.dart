// : (){} "" <> ? _ ! *
import 'package:equatable/equatable.dart';
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';

class UserEntity extends Equatable {
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
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, avatar, cover, email, bio, phone, role];
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