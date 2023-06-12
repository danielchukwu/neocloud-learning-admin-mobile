import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';

// We named the class AppNotification instead of just Notification 
// because there is a built-in class in flutter that goes by the name Notification
class AppNotification {
  final String id;
  final Account user;
  final String type;
  final String body;
  final String? dueDate;
  final String createdAt;

  const AppNotification({
    required this.id, 
    required this.user, 
    required this.type, 
    this.dueDate,
    required this.body, 
    required this.createdAt
  });
}

List<AppNotification> notificationsList = [
    AppNotification(
      id: '1',
      user: users[0],
      type: 'Classwork',
      dueDate: 'tomorrow',
      body: 'Build an Ecommerce Platform.',
      createdAt: '2023-05-11 10:00:00',
    ),
    AppNotification(
      id: '2',
      user: users[1],
      type: 'Announcement',
      body: 'It was brought to my notice that we’ve not gone for a proper outing in months. We will be going for one this weekend.',
      createdAt: '2023-05-11 11:00:00',
    ),
    AppNotification(
      id: '3',
      user: users[2],
      type: 'Missed',
      body: 'You missed my class today. Hope you’re okay.',
      createdAt: '2023-05-11 11:00:00',
    ),
    AppNotification(
      id: '4',
      user: users[3],
      type: 'Classwork Score',
      body: 'You tried john, I see a lot of improvements from the last submission',
      createdAt: '2023-05-11 11:00:00',
    ),
    AppNotification(
      id: '5',
      user: users[4],
      type: 'Submitted Classwork',
      body: 'Sir I really worked hard to meet up to with the deadline for this classwork.',
      createdAt: '2023-05-11 11:00:00',
    ),

  ];