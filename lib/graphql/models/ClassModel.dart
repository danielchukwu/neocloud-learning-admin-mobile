import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class ClassModel {
  final String id;
  final String name;
  final String? about;
  final String? avatar;
  final FacultyModel? faculty;
  final List<UserModel>? educators;
  final UserModel? hod;
  // hod: User!

  ClassModel({
    required this.id,
    required this.name,
    this.about,
    this.avatar,
    this.faculty,
    this.educators,
    this.hod
  });

  static ClassModel fromMap({required Map aClass}) => ClassModel(
    id: aClass['_id'],
    name: aClass['name'],
    about: aClass['about'],
    avatar: aClass['avatar'],
    faculty: FacultyModel(
      id: aClass['faculty']['_id'],
      name: aClass['faculty']['name'],
    ),
    educators: List.generate(aClass['educators'].length, (index) => UserModel(
      id: aClass['educators'][index]['_id'],
      name: aClass['educators'][index]['name'],
    ),).toList(),
    hod: UserModel(
      id: aClass['faculty']['hod']['_id'],
      name: aClass['faculty']['hod']['name'],
    ),
  );
}
