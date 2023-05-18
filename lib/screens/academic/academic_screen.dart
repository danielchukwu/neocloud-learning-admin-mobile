import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_schedule_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_works_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/faculty_body.dart';

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
          routeWidget1: ProfileScreen(user: users[0]),
        ),

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
                  border: Border(bottom: BorderSide(color: kBlack50, width: .2))
                  ),
                child: DisplayOptions(
                  items: AcademicOptions.items,
                  getSelectedIndex: AcademicOptions.getSelectedIndex,
                  press: updateSelectedOption,
                ),
              ),

              // Underneath Background Layer Seperator
              Container(
                height: defaultSize * .7,
                color: kBlack.withOpacity(.03),
              ),

              // HEADER = Classes - Count (styled background)
              Container(
                padding: EdgeInsets.symmetric(vertical: defaultSize),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: kBlack50, width: .2), bottom: BorderSide(color: kBlack50, width: .2))
                  ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Title
                    SizedBox(width: defaultSize * 2),
                    TextLarge(title: "Classes", weight: FontWeight.w700),
              
                    // Count
                    Spacer(),
              
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: defaultSize * 10,
                        height: defaultSize * 4,
                        decoration: BoxDecoration(
                          color: kBlack.withOpacity(.05),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultSize * 1.5), bottomLeft: Radius.circular(defaultSize * 1.5))
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            TextLarge(title: "45", color: kBlack50, weight: FontWeight.w500,),
                            Spacer(),
                          ],
                        ),
                      ),
                    )
              
                  ],
                ),
              ),
              // SizedBox(height: defaultSize * 2),

              // Load Body
              // Classes
              AcademicOptions.selectedIndex == 0
                  ? const ClassBody()
                  : const SizedBox(),

              // Faculty
              AcademicOptions.selectedIndex == 1
                  ? const FacultyBody()
                  : const SizedBox(),

              // ClassRoutine - show if selected
              AcademicOptions.selectedIndex == 2
                  ? const ClassSchedulesBody()
                  : const SizedBox(),

              // Event Calendar
              AcademicOptions.selectedIndex == 3
                  ? const ClassworksBody()
                  : const SizedBox(),

            ],
          ),
        ),
      ]),
      bottomNavigationBar: const AppsBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: kWhite),
        backgroundColor: kBlue,
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
