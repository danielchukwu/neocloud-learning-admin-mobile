import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

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
          SizedBox(height: defaultSize * 2),
          buildHeader(),

          // Classes - count - stackedImages | classworks - count - stackedImages
          SizedBox(height: defaultSize * 3),
          buildTextCountStackedImages(
              title: "Attendance", users: users, length: users.length),
          SizedBox(height: defaultSize * 3),
          buildTextCountStackedImages(
            title: "Classes",
            classes: coursesList,
            length: coursesList.length,
          ),
          SizedBox(height: defaultSize * 3),
          buildTextCountStackedImages(
              title: "Classwork's", users: users, length: users.length),
        ],
      ),
    );
  }

  Row buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Today
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Greetings
            TextSmall(
              title: "Hi, Goodmorning",
              color: kBlack50,
              weight: FontWeight.w500,
            ),
            
            // {Name}{Role Icon} e.g Chukwu Daniel ⚡
            // TextRoleIcon(title: "Edwin Vladimir", svg: getRoleSvgFileName(roleList: users[0].role), fontSize: defaultSize * 2.2, color: kBlack80, weight: FontWeight.w600, iconSize: defaultSize * 2),
            IconText(
              title: "Edwin Vladimir",
              color: kBlack80,
              fontWeight: FontWeight.w600,
              fontSize: defaultSize * 2.2,
              svg: getRoleSvgFileName(roleList: users[0].role),
              iconSize: defaultSize * 2,
            ),
          ],
        ),
        // Avatar
        RoundBoxAvatar(
          width: defaultSize * 6,
          height: defaultSize * 6,
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
            : SizedBox(),
        users != null
            ? Expanded(child: buildStackedUserImgs(users: users))
            : SizedBox(),
      ],
    );
  }

  SizedBox buildTextCount(String title, int length) {
    return SizedBox(
      width: (SizeConfig.screenWidth! / 2) - defaultSize * 2,
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
