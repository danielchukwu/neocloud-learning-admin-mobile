import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/models/students.dart';
import 'package:neocloud_mobile/screens/Profile/components/intro_name_role_ratings.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_cards_list.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_navbar_and_content.dart';
import 'package:neocloud_mobile/screens/Profile/components/stack_cover_and_profile_image.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static String screenName = "Profile";
  final String coverImg = 'assets/images/nct-office.jpg';
  final user = users[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(
        title: screenName,
        bgColor: const Color.fromRGBO(0, 0, 0, 0),
        isDark: false,
        actionIcon: Icons.settings,
        routeName: getRouteName(SettingsScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack Required Section - cover img, round bg, profile img
            StackCoverAndProfileImage(
              coverImg: coverImg,
              profileImg: user.avatar,
              coverSize: defaultSize * 27,
              coverOverlay: kBlack.withOpacity(.2),
              profileImgBorderSize: defaultSize * .3,
            ),

            // User Short Intro - name, role, ratings ⭐
            IntroNameRoleRatings(user: user),

            // Info Cards (Students, Courses, Reviews)
            SizedBox(height: defaultSize * 2),
            ProfileCardsList(user: user),

            // Profile Navbar and Profiles Content (Courses, Activity, Info)
            SizedBox(height: defaultSize * 3),
            ProfileNavbarAndContent(navItems: ProfileNavbarItems.educatorItems),

            SizedBox(height: defaultSize * 3),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AppsBottomNavBar(),
    );
  }
}

