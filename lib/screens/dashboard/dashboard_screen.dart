// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/screens/dashboard/components/body.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static String screenName = 'dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>();
    return Scaffold(
      body: SafeArea(child: Body()),
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
