import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ClassSchedule.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

class ClassScheduleCard extends StatelessWidget {
  const ClassScheduleCard({
    super.key,
    required this.clas,
  });

  final ClassSchedule clas;

  @override
  Widget build(BuildContext context) {
    List<Map> tabletData = [
      {'value': clas.createdAt, 'color': kOrange},
      {'value': 'Incoming Classwork', 'color': kRed},
    ];

    return Container(
      padding: screenPadding,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Class week and Lecture count and date
          SizedBox(height: defaultSize * 1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Class Week - Class Count
              TextSmall(
                  title: 'Week 3 - 7th Class',
                  color: kBlack70,
                  weight: FontWeight.w500),
              // Live or Time it's coming
              TextSmall(title: 'Live', color: kBlue, weight: FontWeight.w500),
            ],
          ),

          // Class Title
          SizedBox(height: defaultSize),
          buildCardHeader(title: clas.title),

          // Educator {Avatar - Name}
          SizedBox(height: defaultSize),
          buildAvatarAndName(
              avatar: clas.educator.avatar,
              name: clas.educator.fullName,
              fontSize: defaultSize * 1.6,
              weight: FontWeight.w600),

          // About
          SizedBox(height: defaultSize * 1.5),
          TextSmall(title: 'Subject', color: kBlack70),
          TextSmall(
            title: clas.subject,
            color: kBlack70,
            weight: FontWeight.w600,
          ),

          // Bottom Tablets
          SizedBox(height: defaultSize * 2),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              tabletData.length,
              (index) => TextColorTablet(
                title: '${tabletData[index]['value']}',
                bgColor: tabletData[index]['color'],
              ),
            ),
          ),

          SizedBox(height: defaultSize * 2.5),
        ],
      ),
    );
  }
}
