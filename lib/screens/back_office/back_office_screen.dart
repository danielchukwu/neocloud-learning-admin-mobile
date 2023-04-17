import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/back_office/components/books_body.dart';
import 'package:neocloud_mobile/utils.dart';

class BackOfficeScreen extends StatefulWidget {
  const BackOfficeScreen({Key? key}) : super(key: key);
  static String screenName = "Back Office";

  @override
  State<BackOfficeScreen> createState() => _BackOfficeScreenState();
}

class _BackOfficeScreenState extends State<BackOfficeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: BackOfficeScreen.screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: false,
        routeName: getRouteName(ProfileScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: screenPadding,
          child: Column(
            children: <Widget>[
              // Academic Options (Attendance, Class routine, Courses, etc...)
              SizedBox(height: defaultSize),
              DisplayOptions(
                items: BackOfficeOptions.items,
                getSelectedIndex: BackOfficeOptions.getSelectedIndex,
                press: updateSelectedOption,
              ),

              // Attendance - show this if selected
              SizedBox(height: defaultSize),
              BackOfficeOptions.selectedIndex == 0 ? const BooksBody() : const SizedBox(),

              // // ClassRoutine - show if selected
              // AcademicOptions.selectedIndex == 1 ? const ClassRoutineBody() : const SizedBox(),
              //
              // // Courses
              // AcademicOptions.selectedIndex == 2 ? const CoursesBody() : const SizedBox(),
              //
              // // Syllabus
              // AcademicOptions.selectedIndex == 3 ? const SyllabusBody() : const SizedBox(),

            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }

  // Options - updates option selection
  updateSelectedOption(int index) {
    setState(() {
      BackOfficeOptions.setSelectedIndex(index);
    });
  }
}
