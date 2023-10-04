// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/class_list.dart';
import 'package:neocloud_mobile/components/Lists/class_schedule_list.dart';
import 'package:neocloud_mobile/components/Lists/class_works_list.dart';
import 'package:neocloud_mobile/components/Lists/faculty_list.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/screens/academic/components/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/Profile/components/current-old-header.dart';

import '../../components/popups/popups.dart';

// @RoutePage()
class AcademicScreen extends StatefulWidget {
  const AcademicScreen({Key? key}) : super(key: key);
  static String screenName = "academic";

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
            showLeading: false,
            showAction1: false,
            showAction2: false),

        // App Body
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Academic Options
              // [     Classes    ] [    Faculties    ]
              // [   Classworks   ] [ Class Schedules ]
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Theme.of(context).canvasColor.withOpacity(.5), width: .2))),
                child: DisplayOptions(
                  items: AcademicOptions.items,
                  getSelectedIndex: AcademicOptions.getSelectedIndex,
                  press: updateSelectedOption,
                ),
              ),

              // Underneath Background Layer Separator
              Container(
                height: 7,
                color: Theme.of(context).canvasColor.withOpacity(.03),
              ),

              // Header - Classes, Count (styled background)
              CurrentOldHeader(
                title:
                    AcademicOptions.items[AcademicOptions.selectedIndex].title,
                rightText: AcademicOptions.selectedIndex < 2 ? '2' : 'Old',
                selectedLeft: AcademicOptions
                    .items[AcademicOptions.selectedIndex].selectedCurrent,
                pressLeft: () => setState(() {
                  AcademicOptions.items[AcademicOptions.selectedIndex]
                      .selectedCurrent = true;
                }),
                pressRight: () => setState(() {
                  AcademicOptions.items[AcademicOptions.selectedIndex]
                      .selectedCurrent = false;
                }),
              ),

              // Load Body
              // Classes
              AcademicOptions.selectedIndex == 0
                  ? const ClassList()
                  : const SizedBox(),

              // Faculty
              AcademicOptions.selectedIndex == 1
                  ? const FacultyList()
                  : const SizedBox(),

              // Classworks
              AcademicOptions.selectedIndex == 2
                  ? const ClassworksList(showFeedback: false)
                  : const SizedBox(),

              // Class Schedules
              AcademicOptions.selectedIndex == 3
                  ? const ClassSchedulesList()
                  : const SizedBox(),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: const AppsBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        const Spacer(),

                        // Popup card
                        Container(
                          margin: screenPadding,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: getColorOpposite(Theme.of(context).canvasColor)),
                          child: Column(
                            children: [
                              buildButton(
                                title: 'Faculty',
                                press: showCreateFacultyScreen,
                              ),
                              const HorizontalRule(),
                              buildButton(
                                title: 'Class',
                                press: showCreateClassScreen,
                              ),
                              const HorizontalRule(),
                              buildButton(
                                title: 'Class Instance',
                                press: showCreateClassInstanceScreen,
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),
                      ],
                    )),
              );
            },
          );
        },
        backgroundColor: kBlue,
        child: Icon(Icons.add, color: getColorOpposite(Theme.of(context).canvasColor)),
      ),
    );
  }

  Widget buildButton({required String title, required Function press}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        press();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: Colors.transparent,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextMedium(
            title: title,
            color: Theme.of(context).canvasColor.withOpacity(.7),
            weight: FontWeight.w600,
          )
        ]),
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
