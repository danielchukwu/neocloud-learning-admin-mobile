import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/attendance_card.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/components/academic_filter_section.dart';
import 'package:neocloud_mobile/utils.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({Key? key}) : super(key: key);
  static String screenName = "Academic";

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: AcademicScreen.screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: false,
        routeName: getRouteName(ProfileScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: screenPadding,
          child: Column(
            children: [
              // Academic Options (Attendance, Class routine, Courses, etc...)
              SizedBox(height: defaultSize),

              DisplayOptions(
                items: AcademicOptions.items,
                getSelectedIndex: AcademicOptions.getSelectedIndex,
                press: (int index) {
                  setState(() {
                    AcademicOptions.setSelectedIndex(index);
                  });
                },
              ),

              // Filter Section
              SizedBox(height: defaultSize * 3),
              const AcademicFilterSection(),

              // + Take Attendance and Create Attendance Cards
              SizedBox(height: defaultSize * 3),
              Column(
                children: <Widget>[
                  // + Take Attendance Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buildAddButton(title: "Take Attendance", press: (context) {}),
                    ],
                  ),

                  // Cards
                  // AttendanceCard(data: data)

                ],
              )
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
