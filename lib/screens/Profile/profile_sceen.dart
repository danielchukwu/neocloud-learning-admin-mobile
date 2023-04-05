import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/students.dart';
import 'package:neocloud_mobile/screens/Profile/components/stack_cover_and_profile_image.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static String screenName = "Profile";
  final String coverImg = 'assets/images/nct-office.jpg';
  final user = users[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(
        title: screenName,
        bgColor: Color.fromRGBO(0, 0, 0, 0),
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
            //
            // Padding(
            //   padding: screenPadding,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       TextExtraLarge(
            //         title: user.fullName,
            //         color: kBlack80,
            //         weight: FontWeight.w600,
            //       ),
            //       TextMedium(title: "NCT " + user.role, color: kBlack70),
            //       Row(
            //         children: <Widget>[
            //
            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
