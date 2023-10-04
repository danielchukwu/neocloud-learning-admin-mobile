import 'package:flutter/material.dart';
// import 'package:neocloud_mobile/components/cards/class_academic_card.dart';
// import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/screens/faculty/faculty_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

// : (){} "" <> ? _ ! *
class FacultyCard extends StatelessWidget {
  const FacultyCard({
    super.key,
    required this.faculty,
  });

  final FacultyModel faculty;

  @override
  Widget build(BuildContext context) {
    List<String> facultyTitleList = faculty.name.split(" ");
    String smallText = facultyTitleList.length > 1
        ? ' ${facultyTitleList.sublist(
              1,
            ).join(' ')}'
        : '';
    String bigText = facultyTitleList[0];
    List<Map> tabletData = [
      {'count': 3, 'type': 'Educator', 'color': kOrange},
      {'count': 3, 'type': 'Class', 'color': kRed},
      {'count': 3, 'type': 'Student', 'color': kGreen},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FacultyScreen(faculty: faculty),
              )),
          child: Container(
            padding: screenPadding,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Theme.of(context).canvasColor.withOpacity(.5), width: .2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Faculty Title
                SizedBox(height: defaultSize * 1),
                TextBigSmall(
                  bigText: bigText,
                  smallText: smallText,
                  bigTextSize: defaultSize * 4,
                  bigTextWeight: FontWeight.w200,
                  smallTextSize: defaultSize * 1.6,
                  smallTextWeight: FontWeight.w600,
                ),

                // Faculty Owner
                SizedBox(height: defaultSize),
                CircularAvartarAndName(
                    avatar: faculty.hod!.avatar,
                    name: faculty.hod!.name,
                    fontSize: defaultSize * 1.6,
                    weight: FontWeight.w600),

                // Faculty intro description
                SizedBox(height: defaultSize * 2),
                TextCustomMaxLine(
                  title: faculty.about ?? 'about not found',
                  color: Theme.of(context).canvasColor.withOpacity(.7),
                  fontSize: defaultSize * 1.6,
                  maxLines: 2,
                ),

                // Bottom Tablets
                SizedBox(height: defaultSize * 2),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    tabletData.length,
                    (index) => TextColorTablet(
                      title:
                          '${tabletData[index]['count']} ${getPluralOrSingular(
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
        ),
        // Dates
      ],
    );
  }
}
