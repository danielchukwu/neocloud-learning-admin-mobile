import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassModel {
  final String? id;
  final String? name;
  final String? about;
  final String? avatar;
  final FacultyModel? faculty;
  final List<ClassModuleModel>? modules;
  final List<UserModel>? educators;
  // final UserModel? hod;
  // hod: User!

  ClassModel({
    this.id,
    this.name,
    this.about,
    this.avatar,
    this.modules,
    this.faculty,
    this.educators,
    // this.hod
  });

  factory ClassModel.fromMap({required Map aClass}) => ClassModel(
        id: aClass['_id'],
        name: aClass['name'],
        about: aClass['about'],
        avatar: aClass['avatar'],
        modules: aClass.containsKey('modules')
            ? List.generate(
                aClass['modules'].length,
                (index) => ClassModuleModel.fromMap(
                  classModule: aClass['modules'],
                ),
              )
            : null,
        faculty: aClass.containsKey('faculty')
            ? FacultyModel.fromMap(faculty: aClass['faculty'])
            : null,
        educators: aClass.containsKey('educators')
            ? List.generate(
                aClass['educators'].length,
                (index) => UserModel.fromMap(
                  user: aClass['educators'][index],
                ),
              ).toList()
            : null,
      );
}

// query Query($limit: Int, $name: String) {
//   classes(limit: $limit, name: $name) {
//     _id
//     name
//     about
//     avatar
//     modules {
//       _id
//       title
//     }
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