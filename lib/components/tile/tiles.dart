import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/stacks.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/class/class_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.title,
    required this.avatar,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final String avatar;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: defaultSize * 2),
      child: Row(
        children: <Widget>[
          // Avatar
          CircleAvatar(
              backgroundImage: AssetImage(avatar), radius: defaultSize * 2.8),
          // StackedImageAndDot(img: avatar, text: "1"),
          SizedBox(width: defaultSize * 2),
          // Name and Role
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMedium(
                  title: title, weight: FontWeight.w600, color: kBlack90),
              TextMedium(
                  title: subtitle, weight: FontWeight.w500, color: kBlack50),
            ],
          ),

          const Spacer(),

          trailing != null ? trailing! : const SizedBox(),
        ],
      ),
    );
  }
}

class ClassTile extends StatelessWidget {
  const ClassTile({
    super.key,
    required this.clas,
  });

  final Class clas;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClassScreen(clas: clas),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Class Avatar
          Image.asset(
            clas.avatar,
            width: defaultSize * 9,
          ),

          // Class Info
          SizedBox(width: defaultSize * 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TextCustomMaxLine(
                  title: clas.title,
                  weight: FontWeight.w600,
                  color: kBlack90,
                  fontSize: defaultSize * 1.8,
                  maxLines: 2,
                ),

                // Avatar and Name
                SizedBox(height: defaultSize * .5),
                buildAvatarAndName(
                  avatar: clas.educator.avatar,
                  imgSize: defaultSize * 2.5,
                  name: clas.educator.fullName + clas.educator.fullName,
                  fontSize: defaultSize * 1.6,
                  weight: FontWeight.w600,
                ),

                // Time of next class
                SizedBox(height: defaultSize * .5),
                IconText(
                  title: '10:30 - 12:30',
                  icon: Icons.watch_later_rounded,
                  fontSize: defaultSize * 1.4,
                  iconSize: defaultSize * 1.6,
                  iconColor: kBlack70,
                ),

                SizedBox(height: defaultSize * 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// This tile basically displays a profile image, name,
// whether the person is live or not and time of class
class UserActivityTile extends StatelessWidget {
  const UserActivityTile({super.key, required this.user});

  final Account user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(user: user),
        ),
      ),
      child: Row(
        children: <Widget>[
          // Images
          StackedImageAndDot(img: user.avatar, text: "2"),
          // Users name and Live - Time
          SizedBox(width: defaultSize * 1.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text (Name)
              // TextRoleIcon(
              //   svg: getRoleSvgFileName(roleList: user.role),
              //   title: user.fullName,
              //   weight: FontWeight.w600,
              //   fontSize: defaultSize * 1.6,
              // ),
              IconText(
                title: user.fullName,
                color: kBlack80,
                fontWeight: FontWeight.w600,
                fontSize: defaultSize * 1.6,
                iconIsLeft: false,
                svg: getRoleSvgFileName(roleList: user.role),
                iconSize: 16,
              ),

              // Text (Live - Time)
              AppsTextRich(
                text1: "Live",
                text2: "  10:00-1:30",
                text1FontSize: defaultSize * 1.4,
                text2FontSize: defaultSize * 1.4,
                text1Color: kBlue,
                text2Color: kBlack50,
                text1FontWeight: FontWeight.w700,
              ),
            ],
          )
        ],
      ),
    );
  }
}
