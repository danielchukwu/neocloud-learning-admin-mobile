import 'package:neocloud_mobile/models/Students.dart';

class Faculty {
  final String id;
  final String title;
  final Account hod;
  final String about;
  final List<String>? classesList;
  final List<String>? educatorsList;
  final List<String>? studentsList;
  final int? classesCount;
  final int? educatorsCount;
  final int? studentsCount;

  const Faculty({
    required this.id,
    required this.title,
    required this.hod,
    required this.about,
    this.classesList,
    this.educatorsList,
    this.studentsList,
    this.classesCount,
    this.educatorsCount,
    this.studentsCount,
  });
}

String about =
    "Welcome to this single handedly managed faculty at NCT that is absolutely wonderful all the way. This faculty offers a variety of courses that can take you from Zero to Hero, you don’t need to have any prior experience with Architectural Design and what not. By the time you join us in taking some of the amazing classes currently available all at your disposal, you will be an expert when we are done with you, you will thank us soo much tears would roll out of your eyes. If you are interested in what we have to offer, Hesitate no more and join us today.";

List<Faculty> facultiesList = [
  Faculty(
    id: "1",
    title: "Architectural Design",
    hod: users[0],
    about: about,
    classesCount: 6,
    educatorsCount: 6,
    studentsCount: 5,
  ),
  Faculty(
    id: "2",
    title: "Cyber Security",
    hod: users[1],
    about: about,
    classesCount: 6,
    educatorsCount: 6,
    studentsCount: 5,
  ),
  Faculty(
    id: "3",
    title: "Data Science",
    hod: users[2],
    about: about,
    classesCount: 3,
    educatorsCount: 5,
    studentsCount: 5,
  ),
  Faculty(
    id: "4",
    title: "Digital Business",
    hod: users[3],
    about: about,
    classesCount: 8,
    educatorsCount: 4,
    studentsCount: 11,
  ),
  Faculty(
    id: "5",
    title: "Programming",
    hod: users[4],
    about: about,
    classesCount: 6,
    educatorsCount: 6,
    studentsCount: 25,
  ),
  Faculty(
    id: "6",
    title: "Visual Communication",
    hod: users[1],
    about: about,
    classesCount: 6,
    educatorsCount: 5,
    studentsCount: 19,
  ),
  Faculty(
    id: "7",
    title: "Communication",
    hod: users[0],
    about: about,
    classesCount: 3,
    educatorsCount: 1,
    studentsCount: 5,
  ),
  Faculty(
    id: "8",
    title: "IT Fundamentals",
    hod: users[3],
    about: about,
    classesCount: 2,
    educatorsCount: 2,
    studentsCount: 5,
  ),
];
