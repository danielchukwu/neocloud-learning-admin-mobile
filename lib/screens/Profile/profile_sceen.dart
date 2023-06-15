import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
// import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/components/intro_name_role_ratings.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_students_classes_reviews_count.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_navbar_and_content.dart';
import 'package:neocloud_mobile/screens/Profile/components/stack_cover_and_profile_image.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  static String screenName = "Profile";
  final String coverImg = 'assets/images/nct-office.jpg';
  final Account user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(title: screenName, bgColor: kWhite, actionIcon1: Icons.settings, isDark: true, routeName1: getRouteName(SettingsScreen.screenName), showLeading: false),

          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[

                // Stack Required Section - cover img, round bg, profile img
                StackCoverAndProfileImage(
                  cover: coverImg,
                  avatar: user.avatar,
                  roleSvg: getRoleSvgFileName(roleList: user.role),
                  containerSize: defaultSize * 14.5,
                  coverSize: defaultSize * 13,
                  coverOverlay: kBlack.withOpacity(.2),
                  profileImgBorderSize: defaultSize * .3,
                  profileImageVerticalPosition: defaultSize * 2.5,
                ),

                // User Short Intro - name, role, ratings ⭐
                // SizedBox(height: defaultSize * 2),
                IntroNameRoleRatings(user: user),

                // Info Cards (Students, Courses, Reviews)
                SizedBox(height: defaultSize * 2),
                ProfileStudentsClassesReviewsCount(user: user),

                // Profile Navbar and Profiles Content (Courses, Activity, Info)
                SizedBox(height: defaultSize * 3),
                ProfileNavbarAndContent(
                    navItems: ProfileNavbarItems.items),

                SizedBox(height: defaultSize *3),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppsBottomNavBar(),
    );
  }
}
