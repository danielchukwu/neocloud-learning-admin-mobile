// CLASS ROUTINE
import 'package:neocloud_mobile/models/ClassWork.dart';
import 'package:neocloud_mobile/models/Students.dart';

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
  ClassSchedule(
      id: '1',
      title: 'Maths',
      subject: 'Algebra',
      educator: users[0],
      startTime: '9:00 AM',
      endTime: '10:30 AM',
      createdAt: '2023-03-15'),
  ClassSchedule(
      id: '2',
      title: 'Science',
      subject: 'Biology',
      educator: users[1],
      startTime: '10:45 AM',
      endTime: '12:15 PM',
      createdAt: '2022-09-09'),
  ClassSchedule(
      id: '3',
      title: 'English',
      subject: 'Grammar',
      educator: users[2],
      startTime: '1:00 PM',
      endTime: '2:30 PM',
      createdAt: '2023-03-28'),
  ClassSchedule(
      id: '4',
      title: 'Social Studies',
      subject: 'History',
      educator: users[3],
      startTime: '2:45 PM',
      endTime: '4:15 PM',
      createdAt: '2022-04-04'),
  ClassSchedule(
      id: '5',
      title: 'Data Analysis',
      subject: 'Data Migration',
      educator: users[4],
      startTime: '12:45 PM',
      endTime: '2:15 PM',
      createdAt: '2023-04-11'),
];
