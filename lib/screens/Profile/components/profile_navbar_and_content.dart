import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/cards.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/AccountInfo.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/models/class_work.dart';
import 'package:neocloud_mobile/screens/Profile/components/account_info_tile.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_content.dart';
import 'package:neocloud_mobile/size_config.dart';

class ProfileNavbarAndContent extends StatefulWidget {
  ProfileNavbarAndContent({ super.key, required this.navItems });
  final List<ProfileNavbarItem> navItems;

  @override
  State<ProfileNavbarAndContent> createState() =>
      _ProfileNavbarAndContentState();
}

class _ProfileNavbarAndContentState extends State<ProfileNavbarAndContent> {
  final List<ClassWork> classWorkData = classWorksData;

  // Tip: <appsBodyPadding> stands for both left padding and right padding
  // values for our apps official screen paddings
  late double selectorWidth =
      (SizeConfig.screenWidth! - (appsBodyPadding * 2)) /
          widget.navItems.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          // Icon Buttons - courses, activities & info
          buildNavbarIconButtons(),

          // Selector - used to select the currently chosen navbar item
          SizedBox(height: defaultSize),
          buildNavbarSelector(),

          // Display content - based on the navbar button clicked, this changes
          ProfileContent(type: widget.navItems[ProfileNavbarItems.selectedIndex].title),

          SizedBox(height: defaultSize * 10),
        ],
      ),
    );
  }

  Stack buildNavbarSelector() {
    return Stack(
      children: <Widget>[
        // Divider Line
        Positioned(
          child: Divider(
            color: kBlack.withOpacity(.2),
            height: defaultSize * .5,
            thickness: defaultSize * .1,
          ),
        ),
        // Selector
        AnimatedPositioned(
          width: selectorWidth,
          left: getPosition(),
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 100),
          child: Container(
            color: kBlack80,
            height: defaultSize * .2,
          ),
        )
      ],
    );
  }

  // Navbar Icons
  Row buildNavbarIconButtons() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          widget.navItems.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  ProfileNavbarItems.selectedIndex = index;
                });
              },
              child: SvgPicture.asset(
                widget.navItems[index].iconSrc,
                color: index == ProfileNavbarItems.selectedIndex
                    ? kBlack80
                    : kBlack50,
                width: index == 0 ? defaultSize * 3 : defaultSize * 3.5,
              ),
            ),
          ),
        ));
  }

  // Returns the position horizontally where the selector should be
  double getPosition() {
    if (ProfileNavbarItems.selectedIndex == 0) {
      return 0;
    } else if (ProfileNavbarItems.selectedIndex == 1) {
      return selectorWidth;
    } else {
      return selectorWidth + selectorWidth;
    }
  }
}
