import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassModel {
  final String? id;
  final String? name;
  final String? about;
  final String? avatar;
  final FacultyModel? faculty;
  final List<UserModel>? educators;
  // final UserModel? hod;
  // hod: User!

  ClassModel({
    required this.id,
    required this.name,
    this.about,
    this.avatar,
    this.faculty,
    this.educators,
    // this.hod
  });

  factory ClassModel.fromMap({required Map aClass}) => ClassModel(
    id: aClass['_id'],
    name: aClass['name'],
    about: aClass['about'],
    avatar: aClass['avatar'],
    faculty: aClass.containsKey('faculty') ? FacultyModel.fromMap(faculty: aClass['faculty']) : null,
    educators:  aClass.containsKey('educators') 
      ? List.generate(aClass['educators'].length, (index) => UserModel.fromMap(user: aClass['educators'][index])).toList() 
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