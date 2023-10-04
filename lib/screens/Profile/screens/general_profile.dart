import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/constants/constants.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/screens/Profile/components/intro_name_role_ratings.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_students_classes_reviews_count.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_navbar_and_content.dart';
import 'package:neocloud_mobile/screens/Profile/components/stack_cover_and_profile_image.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

class GeneralProfile extends StatelessWidget {
  const GeneralProfile({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppsSliverAppBar(
            title: 'Profile',
            actionIcon1: Icons.settings,
            routeName1: getRouteName(SettingsScreen.screenName),
            showLeading: false,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                // Stack Required Section - cover img, round bg, profile img
                StackCoverAndProfileImage(
                  cover: defaultProfileCover,
                  avatar: user.avatar,
                  roleSvg: getRoleSvgFileName(role: user.role?.name),
                  containerSize: 145,
                  coverSize: 130,
                  coverOverlay: kBlack.withOpacity(.2),
                  profileImgBorderSize: 3,
                  profileImageVerticalPosition: 25,
                ),

                // User Short Intro - name, role, ratings zxz⭐
                IntroNameRoleRatings(user: user),

                // // Info Cards (Students, Courses)
                const SizedBox(height: 10),
                ProfileStudentsClassesReviewsCount(user: user),

                // Profile Navbar and Profiles Content (Courses, Activity, Info)
                const SizedBox(height: 30),
                ProfileNavbarAndContent(navItems: ProfileNavbarItems.items),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
