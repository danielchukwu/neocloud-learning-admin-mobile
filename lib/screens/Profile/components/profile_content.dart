import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/course_list.dart';
import 'package:neocloud_mobile/components/cards.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/AccountInfo.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/Profile/components/account_info_tile.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "courses":
        return Container(
          margin: EdgeInsets.only(top: defaultSize * 2),
          child: CoursesList(coursesList: coursesList),
        );
      case "activities":
        return Container(
          margin: EdgeInsets.only(top: defaultSize * 2),
          child: Column(
              children: List.generate(
            classWorksList.length,
            (index) => ClassWorkCard(data: classWorksList[index]),
          )),
        );
      case "info":
        return Container(
          margin: EdgeInsets.only(top: defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title
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
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
