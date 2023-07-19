import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassModel {
  final String id;
  final String name;
  final String? about;
  final FacultyModel? faculty;
  // hod: User!

  ClassModel({
    required this.id,
    required this.name,
    this.about,
    this.faculty,
  });

  static ClassModel fromMap({required Map aClass}) => ClassModel(
        id: aClass['_id'],
        name: aClass['name'],
        about: aClass['about'],
        faculty: FacultyModel(
          id: aClass['faculty']['_id'],
          name: aClass['faculty']['name'],
          hod: UserModel(
            id: aClass['faculty']['hod']['_id'],
            name: aClass['faculty']['hod']['name'],
          ),
        ),
      );
}
