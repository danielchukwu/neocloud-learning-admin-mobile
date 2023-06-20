// CLASS WORK
import 'package:neocloud_mobile/models/Students.dart';

class AppData {
  AppData({required this.id});
  final String id;
}

class ClassWork extends AppData {
  ClassWork({
    required super.id,
    required this.title,
    required this.description,
    required this.educator,
    required this.course,
    required this.file,
    required this.date,
  });
  final String title;
  final String description;
  final Account educator;
  final String course;
  final String file;
  final String date;
}

String description =
    'Build an ecommerce platform from scratch in 2 days, implement some of the features we’ve looked at in this class listed below. Make sure the UI is as scrumptous as mine is. David and Onome, if you guys don’t do this assignment. God will punish u, when you come for that certificate. That’s btw, All the best guys.';
// Class work objects
List<ClassWork> classWorksList = [
  ClassWork(
    id: "1",
    title: "Build an Ecommerce Platform",
    description: description,
    educator: users[0],
    course: "Cyber Policy and Government",
    file: "assets/images/nct-meeting.png",
    date: "May 3",
  ),
  ClassWork(
    id: "2",
    title: "Build an Ecommerce Platform",
    description: description,
    educator: users[1],
    course: "Cyber Policy and Government",
    file: "assets/files/nct-meeting.pdf",
    date: "Jan 25",
  ),
  ClassWork(
    id: "3",
    title: "Create a Chatbot",
    description: description,
    educator: users[2],
    course: "Artificial Intelligence",
    file: "assets/images/nct-meeting.png",
    date: "Apr 15",
  ),
  ClassWork(
    id: "4",
    title: "Design a Website",
    description: description,
    educator: users[3],
    course: "Web Development",
    file: "assets/files/nct-meeting.pdf",
    date: "Jun 7",
  ),
  ClassWork(
    id: "5",
    title: "Develop a Mobile App",
    description: description,
    educator: users[4],
    course: "Mobile App Development",
    file: "assets/files/nct-meeting.pdf",
    date: "Jul 2",
  ),
];
