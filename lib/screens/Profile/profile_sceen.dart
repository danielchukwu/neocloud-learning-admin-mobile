import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/texts.dart';
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
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(title: screenName, bgColor: kWhite, actionIcon: Icons.settings, isDark: true, routeName: getRouteName(SettingsScreen.screenName)),


          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                // Stack Required Section - cover img, round bg, profile img
                StackCoverAndProfileImage(
                  coverImg: coverImg,
                  profileImg: user.avatar,
                  coverSize: defaultSize * 19,
                  coverOverlay: kBlack.withOpacity(.2),
                  profileImgBorderSize: defaultSize * .3,
                  profileImageVerticalPosition: defaultSize * 7.5,
                  bgCurveVerticalPosition: defaultSize * 14,
                ),

                // User Short Intro - name, role, ratings ⭐
                // SizedBox(height: defaultSize * 2),
                IntroNameRoleRatings(user: user),

                // Info Cards (Students, Courses, Reviews)
                SizedBox(height: defaultSize * 2),
                ProfileCardsList(user: user),

                // Profile Navbar and Profiles Content (Courses, Activity, Info)
                SizedBox(height: defaultSize * 3),
                ProfileNavbarAndContent(
                    navItems: ProfileNavbarItems.educatorItems),

                SizedBox(height: defaultSize * 3),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: AppsBottomNavBar(),
    );
  }
}
