import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

class ClassEntity {
  final String ? id;
  final String ? name;
  final String ? about;
  final String ? avatar;
  final FacultyModel ? faculty;
  final List<UserModel> ? educators;

  ClassEntity({
    this.id,
    this.name,
    this.about,
    this.avatar,
    this.faculty,
    this.educators,
  });
}

// query Query($limit: Int, $name: String) {
//   classes(limit: $limit, name: $name) {
//     _id
//     name
//     about
//     avatar
//     faculty {
//       _id
//       name
//       hod {
//         _id
//         name
//       }
//     }
//     educators {
//       _id
//       name
//     }
//   }
// }