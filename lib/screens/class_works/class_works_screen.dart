import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/class_works/components/class_works_body.dart';
import 'package:neocloud_mobile/utils.dart';

class ClassWorksScreen extends StatelessWidget {
  const ClassWorksScreen({Key? key}) : super(key: key);
  static String screenName = "Class Works";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClassWorkBody(),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
