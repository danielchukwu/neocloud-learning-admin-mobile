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
          _buildHeader(context),

          // Classes - count - stackedImages | classworks - count - stackedImages
          const SizedBox(height: 30),
          _buildTextCountStackedImages(
              context: context,
              title: "Attendance",
              users: users,
              length: users.length),
          const SizedBox(height: 30),
          _buildTextCountStackedImages(
            context: context,
            title: "Classes",
            classes: coursesList,
            length: coursesList.length,
          ),
          const SizedBox(height: 30),
          _buildTextCountStackedImages(
              context: context,
              title: "Classwork's",
              users: users,
              length: users.length),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
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
            // TextSmall(
            //   title: "Hello there",
            //   color: kBlack50,
            //   weight: FontWeight.w500,
            // ),
            Text("Hello there", style: TextStyle(color: Theme.of(context).canvasColor.withOpacity(.5), fontWeight: FontWeight.w500, fontSize: 14)),

            // {Name}{Role Icon} e.g Chukwu Daniel
            const SizedBox(height: 3),
            IconText(
              title: user?.name ?? 'null',
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

  Row _buildTextCountStackedImages({
    required BuildContext context,
    required String title,
    List<Course>? classes,
    List<Account>? users,
    int length = 0,
  }) {
    if (classes == null && users == null) {
      throw Exception(
          "classes and users are both null. Only 1 is allowed to be null (buildTitleCountStackedImages)");
    }
    return Row(
      children: <Widget>[
        // Text - Count
        buildTextCount(context, title, length),

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

  SizedBox buildTextCount(BuildContext context, String title, int length) {
    return SizedBox(
      width: (SizeConfig.screenWidth! / 2) - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 18, color: Theme.of(context).canvasColor.withOpacity(.5), fontWeight: FontWeight.w500)),
          Text("$length", style: TextStyle(fontSize: 18, color: Theme.of(context).canvasColor.withOpacity(.8), fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
