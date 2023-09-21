import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/utils.dart';
import 'package:provider/provider.dart';

class AttendanceClassesCwDashboard extends StatelessWidget {
  const AttendanceClassesCwDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header - Hi, Goodmorning \n {users name}
          const SizedBox(height: 20),
          buildHeader(context),

          // Classes - count - stackedImages | classworks - count - stackedImages
          const SizedBox(height: 30),
          buildTextCountStackedImages(
              title: "Attendance", users: users, length: users.length),
          const SizedBox(height: 30),
          buildTextCountStackedImages(
            title: "Classes",
            classes: coursesList,
            length: coursesList.length,
          ),
          const SizedBox(height: 30),
          buildTextCountStackedImages(
              title: "Classwork's", users: users, length: users.length),
        ],
      ),
    );
  }

  Row buildHeader(BuildContext context) {
    var user = context.watch<UserProvider>().user;
    print(user?.id);
    print(user?.name);
    print(user?.bio);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Today
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Greetings
            TextSmall(
              title: "Hello there",
              color: kBlack50,
              weight: FontWeight.w500,
            ),
            
            // {Name}{Role Icon} e.g Chukwu Daniel ⚡
            // TextRoleIcon(title: "Edwin Vladimir", svg: getRoleSvgFileName(roleList: users[0].role), fontSize: 22, color: kBlack80, weight: FontWeight.w600, iconSize: 20),
            IconText(
              title: user?.name ?? 'null',
              color: kBlack80,
              fontWeight: FontWeight.w600,
              fontSize: 22,
              svg: getRoleSvgFileName(role: users[0].role[0]),
              iconSize: 20,
            ),
          ],
        ),
        // Avatar
        RoundBoxAvatar(
          size: 60,
          image: users[0].avatar,
        ),
      ],
    );
  }

  Row buildTextCountStackedImages(
      {required String title,
      List<Course>? classes,
      List<Account>? users,
      int length = 0}) {
    if (classes == null && users == null) {
      throw Exception(
          "classes and users are both null. Only 1 is allowed to be null (buildTitleCountStackedImages)");
    }
    return Row(
      children: <Widget>[
        // Text - Count
        buildTextCount(title, length),

        // Avatars
        classes != null
            ? Expanded(child: buildStackedClassImgs(classList: classes))
            : const SizedBox(),
        users != null
            ? Expanded(child: buildStackedUserImgs(users: users))
            : const SizedBox(),
      ],
    );
  }

  SizedBox buildTextCount(String title, int length) {
    return SizedBox(
      width: (SizeConfig.screenWidth! / 2) - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextLarge(
            title: title,
            color: kBlack50,
            weight: FontWeight.w500,
          ),
          TextLarge(
            title: "$length",
            color: kBlack80,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
