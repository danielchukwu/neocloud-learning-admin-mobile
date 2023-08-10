import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/models/ProfileNavbarItem.dart';
import 'package:neocloud_mobile/screens/Profile/components/intro_name_role_ratings.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_students_classes_reviews_count.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_navbar_and_content.dart';
import 'package:neocloud_mobile/screens/Profile/components/stack_cover_and_profile_image.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.user}) : super(key: key);
  static String screenName = "Profile";

  final UserModel? user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String coverImg = 'assets/images/nct-office.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(title: ProfileScreen.screenName, bgColor: kWhite, actionIcon1: Icons.settings, isDark: true, routeName1: getRouteName(SettingsScreen.screenName), showLeading: false),

          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[

                // Stack Required Section - cover img, round bg, profile img
                StackCoverAndProfileImage(
                  cover: coverImg,
                  avatar: widget.user!.avatar ?? 'null',
                  roleSvg: getRoleSvgFileName(roleList: [widget.user!.role!.name]),
                  containerSize: defaultSize * 14.5,
                  coverSize: defaultSize * 13,
                  coverOverlay: kBlack.withOpacity(.2),
                  profileImgBorderSize: defaultSize * .3,
                  profileImageVerticalPosition: defaultSize * 2.5,
                ),

                // User Short Intro - name, role, ratings zxz⭐
                // SizedBox(height: defaultSize * 2),
                IntroNameRoleRatings(user: widget.user!),

                // Info Cards (Students, Courses, Reviews)
                SizedBox(height: defaultSize * 1),
                ProfileStudentsClassesReviewsCount(user: widget.user!),

                // Profile Navbar and Profiles Content (Courses, Activity, Info)
                SizedBox(height: defaultSize * 3),
                ProfileNavbarAndContent(
                    navItems: ProfileNavbarItems.items),

                // SizedBox(height: defaultSize *3),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppsBottomNavBar(),
    );
  }
}
