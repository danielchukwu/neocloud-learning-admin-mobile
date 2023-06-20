import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_dashboard.dart';
import 'package:neocloud_mobile/utils.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "dashboard":
        return const ProfileDashboard();
      case "info":
        return const ProfileAbout();
      case "classes":
        return const ProfileClasses();
      default:
        return const SizedBox();
    }
  }
}

class ProfileClasses extends StatelessWidget {
  const ProfileClasses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        classesList.length,
        (index) => ClassCard(clas: classesList[index]),
      ),
    );
  }
}

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = users[9];

    return Container(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Section
          SizedBox(height: defaultSize * 1.5),
          TextLarge(title: 'ABOUT', weight: FontWeight.w500, color: kBlack80),
          // Body
          SizedBox(height: defaultSize),
          TextMedium(
            title: user.about,
            color: kBlack80,
          ),

          // Roles Section
          SizedBox(height: defaultSize * 3),
          TextLarge(title: 'ROLES', weight: FontWeight.w500, color: kBlack80),

          // Icons List
          SizedBox(height: defaultSize),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              user.role.length,
              (index) => IconText(
                title: user.role[index],
                svg: getRoleSvgFileName(roleList: [user.role[index]]),
                iconIsLeft: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
