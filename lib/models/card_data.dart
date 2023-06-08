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

String description = 'Build an ecommerce platform from scratch in 2 days, implement some of the features we’ve looked at in this class listed below. Make sure the UI is as scrumptous as mine is. David and Onome, if you guys don’t do this assignment. God will punish u, when you come for that certificate. That’s btw, All the best guys.';
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

// CLASS ROUTINE
class ClassSchedule extends AppData {
  ClassSchedule({
    required super.id,
    required this.title,
    required this.subject,
    required this.educator,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
  });

  final String title;
  final String subject;
  final Account educator;
  final String startTime;
  final String endTime;
  final String createdAt;
}
// Class routine objects
List<ClassSchedule> classScheduleList = [
  ClassSchedule(id: '1', title: 'Maths', subject: 'Algebra', educator: users[0], startTime: '9:00 AM', endTime: '10:30 AM', createdAt: '2023-03-15'),
  ClassSchedule(id: '2', title: 'Science', subject: 'Biology', educator: users[1], startTime: '10:45 AM', endTime: '12:15 PM', createdAt: '2022-09-09'),
  ClassSchedule(id: '3', title: 'English', subject: 'Grammar', educator: users[2], startTime: '1:00 PM', endTime: '2:30 PM', createdAt: '2023-03-28'),
  ClassSchedule(id: '4', title: 'Social Studies', subject: 'History', educator: users[3], startTime: '2:45 PM', endTime: '4:15 PM', createdAt: '2022-04-04'),
  ClassSchedule(id: '5', title: 'Data Analysis', subject: 'Data Migration', educator: users[4], startTime: '12:45 PM', endTime: '2:15 PM', createdAt: '2023-04-11'),
];