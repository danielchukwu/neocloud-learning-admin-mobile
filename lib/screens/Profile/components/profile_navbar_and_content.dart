import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_content.dart';
import 'package:neocloud_mobile/size_config.dart';

class ProfileNavbarAndContent extends StatefulWidget {
  const ProfileNavbarAndContent({super.key, required this.navItems});

  final List<ProfileNavbarItem> navItems;

  @override
  State<ProfileNavbarAndContent> createState() =>
      _ProfileNavbarAndContentState();
}

class _ProfileNavbarAndContentState extends State<ProfileNavbarAndContent> {
  final List<ClassWork> classWorkData = classWorksList;

  // Tip: <appsBodyPadding> stands for both left padding and right padding
  // values for our apps official screen paddings
  late double selectorWidth =
      (SizeConfig.screenWidth! - (appsBodyPadding * 2)) /
          widget.navItems.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Icon Buttons - courses, activities & info
        buildNavbarIconButtons(),

        // Selector - used to select the currently chosen navbar item
        buildNavbarSelector(),

        // Display content - based on the navbar button clicked, this changes
        ProfileContent(
            type: widget.navItems[ProfileNavbarItems.selectedIndex].title),
      ],
    );
  }

  Widget buildNavbarSelector() {
    return Stack(
      children: <Widget>[
        // Divider Line
        Positioned(
          child: Divider(
            color: Theme.of(context).canvasColor.withOpacity(.2),
            height: 5,
            thickness: 1,
          ),
        ),
        // Selector
        AnimatedPositioned(
          width: selectorWidth,
          left: getSelectorPosition() + 20,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 100),
          child: Container(
            color: Theme.of(context).canvasColor.withOpacity(.8),
            height: 2,
          ),
        )
      ],
    );
  }

  // Navbar Icons
  Widget buildNavbarIconButtons() {
    return Padding(
      padding: screenPadding,
      child: Row(
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
              child: Container(
                color: getColorOpposite(Theme.of(context).canvasColor),
                padding: EdgeInsets.only(
                    top: index == 0 ? 3 : 0, bottom: index == 0 ? 12 : 10),
                child: SvgPicture.asset(
                  widget.navItems[index].iconSrc,
                  color: index == ProfileNavbarItems.selectedIndex
                      ? Theme.of(context).canvasColor.withOpacity(.8)
                      : Theme.of(context).canvasColor.withOpacity(.5),
                  width: widget.navItems[index].size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Returns the position horizontally where the selector should be
  double getSelectorPosition() {
    if (ProfileNavbarItems.selectedIndex == 0) {
      return 0;
    } else if (ProfileNavbarItems.selectedIndex == 1) {
      return selectorWidth;
    } else {
      return selectorWidth + selectorWidth;
    }
  }
}
