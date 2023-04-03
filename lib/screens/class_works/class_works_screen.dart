import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class ClassWorksScreen extends StatelessWidget {
  const ClassWorksScreen({Key? key}) : super(key: key);
  final String screenName = "Class Works";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: screenName, bgColor: kWhite, isDark: true, ),
      body: Container(
        color: Colors.blue,
        child: TextMedium(title: screenName, color: Colors.white),
      ),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
