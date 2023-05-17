import 'Faculty.dart';
import 'Students.dart';

class Class {
  final String id;
  final String title;
  final String avatar;
  final String about;
  final Account educator;
  final Account? hod;
  final Faculty? faculty;

  Class({
    required this.id,
    required this.title,
    required this.avatar,
    required this.about,
    required this.hod,
    required this.educator,
    required this.faculty,
  });
}

String about =
    "In this comprehensive programming class, we will cover a wide range of programming languages, tools, and concepts that are essential in today's technology-driven world. Whether you are a beginner looking to kickstart your programming journey or an experienced developer aiming to expand your skill set, our class is tailored to meet your needs.";

// Items
List<Class> classesList = [
  Class(
    id: "1",
    avatar: "assets/images/course_python.jpg",
    title: "The Ultimate Python Course For Automation Today",
    about: about,
    educator: users[0],
    faculty: facultiesList[4],
    hod: users[4],
  ),
  Class(
    id: "2",
    avatar: "assets/images/course_html&css.jpg",
    title: "The Ultimate HTML & CSS Course Online",
    about: about,
    educator: users[2],
    faculty: facultiesList[2],
    hod: users[3],
  ),
  Class(
    id: "3",
    avatar: "assets/images/course_javascript.jpg",
    title: "The Comprehensive JavaScript Course: Build Real-World Projects",
    about: about,
    educator: users[1],
    faculty: facultiesList[3],
    hod: users[2],
  ),
  Class(
    id: "4",
    avatar: "assets/images/course_react.jpg",
    title: "Mastering React: Build Dynamic Web Applications",
    about: about,
    educator: users[3],
    faculty: facultiesList[0],
    hod: users[1],
  ),
  Class(
    id: "5",
    avatar: "assets/images/course_java.jpg",
    title: "Java Programming for Beginners: Learn Java from Scratch",
    about: about,
    educator: users[4],
    faculty: facultiesList[0],
    hod: users[0],
  ),
  Class(
    id: "6",
    avatar: "assets/images/course_aws.jpg",
    title: "AWS Certified Solutions Architect: Associate Certification",
    about: about,
    educator: users[1],
    faculty: facultiesList[0],
    hod: users[0],
  ),
];
