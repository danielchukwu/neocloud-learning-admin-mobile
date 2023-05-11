import 'package:neocloud_mobile/models/Students.dart';

class Faculty {
  final String id;
  final String title;
  final Account hod;
  final String? about;
  final List<String>? classesList;
  final List<String>? educatorsList;
  final List<String>? studentsList;

  const Faculty({
    required this.id,
    required this.title,
    required this.hod,
    this.about,
    this.classesList,
    this.educatorsList,
    this.studentsList,
  });
}

String about =
    "Welcome to this single handedly managed faculty at NCT that is absolutely wonderful all the way. This faculty offers a variety of courses that can take you from Zero to Hero, you don’t need to have any prior experience with Architectural Design and what not. By the time you join us in taking some of the amazing classes currently available all at your disposal, you will be an expert when we are done with you, you will thank us soo much tears would roll out of your eyes. If you are interested in what we have to offer, Hesitate no more and join us today.";

List<Faculty> facultiesList = [
  Faculty(
    id: "F1",
    title: "Architectural Design",
    hod: users[0],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F2",
    title: "Cyber Security",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F3",
    title: "Data Science",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F4",
    title: "Digital Business",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F5",
    title: "Programming",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F6",
    title: "Visual Communication",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F7",
    title: "Communication",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
  Faculty(
    id: "F8",
    title: "IT Fundamentals",
    hod: users[1],
    about: about,
    classesList: null,
    educatorsList: null,
    studentsList: null,
  ),
];
