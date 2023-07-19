import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/class_list.dart';
import 'package:neocloud_mobile/components/Lists/class_schedule_body.dart';
import 'package:neocloud_mobile/components/Lists/class_works_list.dart';
import 'package:neocloud_mobile/components/Lists/faculty_list.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/ClassSchedule.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';
import 'package:neocloud_mobile/screens/Profile/components/current-old-header.dart';

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
        // App Bar
        buildSliverAppBar(
            title: AcademicScreen.screenName,
            bgColor: kWhite,
            isDark: true,
            showLeading: false,
            showAction1: false,
            showAction2: false),

        // App Body
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Academic Options (
              // [     Classes    ] [    Faculties    ]
              // [   Classworks   ] [ Class Schedules ]
              SizedBox(height: defaultSize),
              Container(
                padding: EdgeInsets.only(bottom: defaultSize * .5),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: kBlack50, width: .2)),
                ),
                child: DisplayOptions(
                  items: AcademicOptions.items,
                  getSelectedIndex: AcademicOptions.getSelectedIndex,
                  press: updateSelectedOption,
                ),
              ),

              // Underneath Background Layer Separator
              Container(
                height: defaultSize * .7,
                color: kBlack.withOpacity(.03),
              ),

              // Header - Classes, Count (styled background)
              CurrentOldHeader(
                title: AcademicOptions.items[AcademicOptions.selectedIndex].title,
                rightText: AcademicOptions.selectedIndex < 2 ? '2' : 'Old',
                selectedLeft: AcademicOptions.items[AcademicOptions.selectedIndex].selectedCurrent,
                pressLeft: () => setState(() {
                  AcademicOptions.items[AcademicOptions.selectedIndex].selectedCurrent = true;
                }),
                pressRight: () => setState(() {
                  AcademicOptions.items[AcademicOptions.selectedIndex].selectedCurrent = false;
                }),
              ),

              // Load Body
              // Classes
              AcademicOptions.selectedIndex == 0
                  ? ClassList(classList: classesList)
                  : const SizedBox(),

              // Faculty
              AcademicOptions.selectedIndex == 1
                  ? FacultyList(facultyList: facultiesList)
                  : const SizedBox(),

              // Classworks
              AcademicOptions.selectedIndex == 2
                  ? ClassworksList(
                      classworksList: classWorksList,
                      showFeedback: false,
                    )
                  : const SizedBox(),

              // Class Schedules
              AcademicOptions.selectedIndex == 3
                  ? ClassSchedulesList(classScheduleList: classScheduleList)
                  : const SizedBox(),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: const AppsBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kBlue,
        child: Icon(Icons.add, color: kWhite),
      ),
    );
  }

  // Options - updates option selection
  updateSelectedOption(int index) {
    setState(() {
      AcademicOptions.setSelectedIndex(index);
    });
  }
}
