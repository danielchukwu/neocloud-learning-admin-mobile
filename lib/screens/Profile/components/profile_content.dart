import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/AccountInfo.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/class_work.dart';
import 'package:neocloud_mobile/screens/Profile/components/account_info_tile.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "courses":
        return Column(
            children: List.generate(
                courses.length, (index) => CourseCard(course: courses[index])));
      case "activities":
        return Column(
            children: List.generate(
              classWorksData.length,
                  (index) => ClassWorkCard(data: classWorksData[index]),
            ));
      case "info":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            SizedBox(height: defaultSize * 2),
            TextCustomMaxLine(
              title: "Account Info",
              fontSize: defaultSize * 2.2,
              weight: FontWeight.w600,
              color: kBlack80,
            ),

            // Account Info Items
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(accountInfos.length,
                        (index) => AccountInfoTile(data: accountInfos[index]))),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
