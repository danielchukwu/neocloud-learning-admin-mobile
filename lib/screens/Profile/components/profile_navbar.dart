import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/size_config.dart';

class ProfileNavbar extends StatefulWidget {
  const ProfileNavbar({
    super.key,
  });

  @override
  State<ProfileNavbar> createState() => _ProfileNavbarState();
}

class _ProfileNavbarState extends State<ProfileNavbar> {
  late double selectorWidth = (SizeConfig.screenWidth! - 40) / 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        children: <Widget>[
          // Icon Buttons - courses, activities & info
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                ProfileNavbarItems.items.length,
                    (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        ProfileNavbarItems.selectedIndex = index;
                      });
                    },
                    child: SvgPicture.asset(
                      ProfileNavbarItems.items[index].iconSrc,
                      color: index == ProfileNavbarItems.selectedIndex
                          ? kBlack80
                          : kBlack50,
                      width: index == 0 ? defaultSize * 3 : defaultSize * 3.5,
                    ),
                  ),
                ),
              )),

          // Divider
          SizedBox(height: defaultSize),
          Stack(
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
          ),
        ],
      ),
    );
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