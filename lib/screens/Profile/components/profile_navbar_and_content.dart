import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/cards.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/size_config.dart';

class ProfileNavbarAndContent extends StatefulWidget {
  const ProfileNavbarAndContent({
    super.key,
    required this.navItems,
  });
  final List<ProfileNavbarItem> navItems;

  @override
  State<ProfileNavbarAndContent> createState() => _ProfileNavbarAndContentState();
}

class _ProfileNavbarAndContentState extends State<ProfileNavbarAndContent> {
  // Tip: <appsBodyPadding> stands for both left padding and right padding
  // values for our apps official padding
  late double selectorWidth =
      (SizeConfig.screenWidth! - (appsBodyPadding * 2)) / widget.navItems.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        children: <Widget>[
          // Icon Buttons - courses, activities & info
          buildNavbarIconButtons(),

          // Selector - is used to select the currently chosen navbar item
          SizedBox(height: defaultSize),
          buildNavbarSelector(),

          // Display content
          buildChosenContent(widget.navItems[ProfileNavbarItems.selectedIndex].title)

        ],
      ),
    );
  }

  Widget buildChosenContent(String name) {
    switch (name){
      case "courses":
        return Column(
            children: List.generate(
              courses.length,
                  (index) => CourseCard(course: courses[index])
            ));
      case "activities":
        return Container(child: TextSmall(title: 'Activities'));
      default:
        return Container(child: TextSmall(title: 'Info'));
    }
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
