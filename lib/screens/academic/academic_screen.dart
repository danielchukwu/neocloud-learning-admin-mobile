import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/components/body/attendance_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/certificate_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_rotine_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/faculty_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/courses_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/event_calendar_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/syllabus_body.dart';
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
      body: CustomScrollView(slivers: <Widget>[
        buildSliverAppBar(
          title: AcademicScreen.screenName,
          bgColor: kWhite,
          isDark: true,
          showLeading: false,
          routeWidget1: ProfileScreen(user: users[0]),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Academic Options (Attendance, Class routine, Courses, etc...)
                SizedBox(height: defaultSize),
                DisplayOptions(
                  items: AcademicOptions.items,
                  getSelectedIndex: AcademicOptions.getSelectedIndex,
                  press: updateSelectedOption,
                ),
          
                // Attendance - show this if selected
                AcademicOptions.selectedIndex == 0
                    ? const AttendanceBody()
                    : const SizedBox(),
          
                // ClassRoutine - show if selected
                AcademicOptions.selectedIndex == 1
                    ? const ClassRoutineBody()
                    : const SizedBox(),
          
                // Courses
                AcademicOptions.selectedIndex == 2
                    ? const CoursesBody()
                    : const SizedBox(),
          
                // Syllabus
                AcademicOptions.selectedIndex == 3
                    ? const SyllabusBody()
                    : const SizedBox(),
          
                // Certificate
                AcademicOptions.selectedIndex == 4
                    ? const CertificateBody()
                    : const SizedBox(),
          
                // Faculty
                AcademicOptions.selectedIndex == 5
                    ? const FacultyBody()
                    : const SizedBox(),
          
                // Class
                AcademicOptions.selectedIndex == 6
                    ? const ClassBody()
                    : const SizedBox(),
          
                // Event Calendar
                AcademicOptions.selectedIndex == 7
                    ? const EventCalendarBody()
                    : const SizedBox(),
          
                // Bottom Padding
                pageBottomPadding(),
              ],
            ),
          ),
        ),
      ]),
      extendBody: true,
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
