import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/utils.dart';

class FacultyCard extends StatelessWidget {
  const FacultyCard({
    super.key,
    required this.faculty,
  });

  final Faculty faculty;

  @override
  Widget build(BuildContext context) {
    // The below list of objects get displayed side by side in the card
    // and we provide a flex to tell determine the amount of flex an item takes up
    // e.g
    // with label
    // Course          | Date
    // Software Deve.. | May 3
    // without label
    //   27  |  March  |  2023
    final sections = [
      {"label": "Head of Faculty", "title": faculty.hod, "flex": 1},
      {"label": "Students", "title": faculty.studentsCount, "flex": 1},
    ];
    List<String> facultyTitleList = faculty.title.split(" ");

    String smallText = facultyTitleList.length > 1
        ? ' ${facultyTitleList.sublist(1,).join(' ')}'
        : '';
    String bigText = facultyTitleList[0];
    List<Map> tabletData = [
      {'count': faculty.educatorsCount, 'type': 'Educator', 'color': kOrange},
      {'count': faculty.classesCount, 'type': 'Class', 'color': kRed},
      {'count': faculty.studentsCount, 'type': 'Student', 'color': kGreen.withOpacity(.9)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: screenPadding,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: kBlack50, width: .2)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Faculty Title
              SizedBox(height: defaultSize * 1),
              TextBigSmall(
                bigText: bigText,
                smallText: smallText,
              ),

              // Faculty Owner
              SizedBox(height: defaultSize),
              buildAvatarAndName(
                  avatar: faculty.hod.avatar,
                  name: faculty.hod.fullName,
                  fontSize: defaultSize * 1.6,
                  weight: FontWeight.w600),

              // Faculty intro description
              SizedBox(height: defaultSize * 2),
              TextCustomMaxLine(
                title: faculty.about ?? 'This faculty has no about',
                color: kBlack70,
                fontSize: defaultSize * 1.6,
                maxLines: 2,
              ),
              
              // Bottom Tablets
              SizedBox(height: defaultSize * 2),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(tabletData.length, (index) => TextColorTablet( 
                  title: '${tabletData[index]['count']} ${getPluralOrSingular( 
                    count: tabletData[index]['count'], 
                    word: tabletData[index]['type'], 
                  )}', 
                  bgColor: tabletData[index]['color'], 
                ),
                ),
              ),

              SizedBox(height: defaultSize * 2.5),
            ],
          ),
        ),
        // Dates
      ],
    );
  }
}
