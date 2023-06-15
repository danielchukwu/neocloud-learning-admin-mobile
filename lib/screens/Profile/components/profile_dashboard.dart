import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/components/current-old-header.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_schedule_body.dart';
import 'package:neocloud_mobile/screens/academic/components/body/class_works_body.dart';
import 'package:neocloud_mobile/screens/class_works/components/class_works_body.dart';

class ProfileDashboard extends StatefulWidget {
  const ProfileDashboard({
    super.key,
  });

  @override
  State<ProfileDashboard> createState() => _ProfileDashboardState();
}

class _ProfileDashboardState extends State<ProfileDashboard> {
  var selectedIndex = 0;
  var sections = ['Schedule', 'CWs'];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize * 1),
      child: Column(
        children: [
          // Row - Shedule, CW, Feedbacks
          buildNavbar(),

          // Current - Old Navbar
          CurrentOldHeader(pressRight: () {}, pressLeft: () {}, title: sections[selectedIndex], rightText: 'Old', selectedLeft: true),

          // List 
          selectedIndex == 0 
            ? ClassSchedulesList()
            : SizedBox(),
          
          selectedIndex == 1 
            ? ClassworksList()
            : SizedBox(),

          // selectedIndex == 2 
          //   ? ClassworksList()
          //   : SizedBox(),
        ],
      ),
    );
  }

  Padding buildNavbar() {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultSize),
          child: Row(
            children: List.generate(
              sections.length,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultSize * .5),
                  child: AppsButton(
                    title: sections[index],
                    padTopBottom: 0,
                    padLeftRight: 0,
                    weight: FontWeight.w600,
                    color: selectedIndex == index ? kWhite : kBlack70,
                    bgColor: selectedIndex == index ? kBlack80 : kBlack.withOpacity(.1),
                    press: (context) {
                      setState((){
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
