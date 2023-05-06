import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/finance/components/finance_body.dart';
import 'package:neocloud_mobile/utils.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({Key? key}) : super(key: key);
  static String screenName = "Finance";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FinanceBody(),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
