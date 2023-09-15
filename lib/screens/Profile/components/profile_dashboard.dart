import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/class_schedule_list.dart';
import 'package:neocloud_mobile/components/Lists/class_works_list.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/components/current-old-header.dart';

import '../../../size_config.dart';

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
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // Row - Shedule, CW, Feedbacks
          buildNavbar(),

          // Current - Old Navbar
          CurrentOldHeader(
              pressRight: () {},
              pressLeft: () {},
              title: sections[selectedIndex],
              rightText: 'Old',
              selectedLeft: true),

          // List
          selectedIndex == 0
              ? ClassSchedulesList(
                  spinnerScreeMaxHeight: SizeConfig.screenHeight! / 3.5,
                )
              : const SizedBox(),

          selectedIndex == 1
              ? ClassworksList(
                  spinnerScreeMaxHeight: SizeConfig.screenHeight! / 3.5,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Padding buildNavbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: List.generate(
          sections.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AppsButton(
                title: sections[index],
                padTopBottom: 0,
                padLeftRight: 0,
                weight: FontWeight.w600,
                color: selectedIndex == index ? kWhite : kBlack70,
                bgColor:
                    selectedIndex == index ? kBlack80 : kBlack.withOpacity(.1),
                press: (context) {
                  setState(() {
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
