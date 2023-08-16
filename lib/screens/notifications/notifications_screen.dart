// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/NotificationModel.dart';
import 'package:neocloud_mobile/graphql/services/notification_service.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/notifications/components/notification_list.dart';

// @RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String screenName = "notifications";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var notiService = NotificationService();
  List<NotificationModel>? dataList = [];

  // final List<AppNotification> notifications = notificationsList;
  // final notificationTypeColors = {'Classwork': kGreen, 'Classwork Score': kGreen, 'Submitted Classwork': kGreen, 'Announcement': kOrange, 'Missed': kRed};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (!mounted) return;
    notiService.getNotifications().then((notiList) {
      setState(() {
        dataList = notiList;
      });
    });
  }

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
            showAction2: false),

        // App Body
        SliverToBoxAdapter(
          child: dataList == null
              ? Center(child: CircularProgressIndicator())
              : dataList!.isEmpty
                  ? Center(child: Text('No Classes Found'))
                  : NotificationList(dataList: dataList!),
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
