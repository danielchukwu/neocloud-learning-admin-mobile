import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Notification.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/notifications/components/notification-card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String screenName = "Notifications";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final List<AppNotification> notifications = notificationsList;
  final notificationTypeColors = {'Classwork': kGreen, 'Classwork Score': kGreen, 'Submitted Classwork': kGreen, 'Announcement': kOrange, 'Missed': kRed};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        // App Bar
        buildSliverAppBar(
          title: NotificationScreen.screenName,
          bgColor: kWhite,
          isDark: true,
          showLeading: false,
          showAction1: false,
          showAction2: false
        ),

        // App Body
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              notifications.length, 
              (index) => NotificationCard(notification: notifications[index], typeColor: notificationTypeColors[ notifications[index].type ])
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }

  // Options - updates option selection
  updateSelectedOption(int index) {
    setState(() {
      AcademicOptions.setSelectedIndex(index);
    });
  }
}