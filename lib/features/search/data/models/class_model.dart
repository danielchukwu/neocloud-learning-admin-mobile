import 'package:neocloud_mobile/features/search/domain/entities/class_entity.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassModel extends ClassEntity {
  ClassModel({
    String ? id,
    String ? name,
    String ? about,
    String ? avatar,
    FacultyModel ? faculty,
    List<UserModel> ? educators,
  }) : super(
    id: id,
    name: name,
    about: about,
    avatar: avatar,
    faculty: faculty,
    educators: educators,
  );

  factory ClassModel.fromMap({required Map data}) => ClassModel(
    id: data['_id'],
    name: data['name'],
    about: data['about'],
    avatar: data['avatar'],
    faculty: data.containsKey('faculty') ? FacultyModel.fromMap(faculty: data['faculty']) : null,
    educators:  data.containsKey('educators') 
      ? List.generate(data['educators'].length, (index) => UserModel.fromMap(user: data['educators'][index])).toList() 
      : null,
  );
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