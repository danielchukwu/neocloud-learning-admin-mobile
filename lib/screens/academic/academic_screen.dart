import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/components/FilterSection.dart';
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
              DisplayOptions(
                items: AcademicOptions.items,
                getSelectedIndex: AcademicOptions.getSelectedIndex,
                press: (int index) {
                  setState(() {
                    AcademicOptions.setSelectedIndex(index);
                  });
                },
              ),
              SizedBox(height: defaultSize * 3),

              // Filter Section
              const FilterSection(),

              // + Take Attendance and create Attendance Cards
              SizedBox(height: defaultSize * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppsButton(
                    title: "Take Attendance",
                    press: (context) {},
                    icon: Icons.add,
                    bgColor: kBlack80,
                    padTopBottom: defaultSize * 0.5,
                    borderRadius: defaultSize * .5,
                  ),
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
