// : (){} "" <> ? _ ! *
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/features/search/domain/entities/user_entity.dart';
import 'package:neocloud_mobile/graphql/models/RoleModel.dart';

class UserModel extends UserEntity {

  UserModel({
    String ? id,
    String ? name,
    String ? avatar,
    String ? cover,
    String ? email,
    String ? bio,
    String ? phone,
    RoleModel ? role,
  }) : super(
    id: id,
    name: name,
    avatar: avatar,
    bio: bio,
    cover: cover,
    email: email,
    phone: phone,
    role: role,
  );

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