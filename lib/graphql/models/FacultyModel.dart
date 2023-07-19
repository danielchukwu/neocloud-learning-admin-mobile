import 'package:neocloud_mobile/graphql/models/UserModel.dart';
// : (){} "" <> ? _ ! *

class FacultyModel {
  final String id;
  final String name;
  final String? about;
  final UserModel? hod;
  // hod: User!

  FacultyModel({
    required this.id,
    required this.name,
    this.about,
    this.hod,
  });

  static FacultyModel fromMap({required Map faculty}) => FacultyModel(
    id: faculty['_id'],
    name: faculty['name'],
    about: faculty['about'],
    hod: UserModel(id: faculty['hod']['_id'], name: faculty['hod']['name']),
  );
}