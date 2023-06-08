import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassWorkCard extends StatelessWidget {
  const ClassWorkCard({
    super.key,
    required this.clas,
  });

  final ClassWork clas;

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
      {"label": "Course", "title": clas.course, "flex": 3},
      {"label": "Date", "title": clas.date, "flex": 2},
    ];

    return Container(
      padding: screenPadding,
      decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: kBlack50, width: .2)
            )
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          // Due - Tomorrow
          SizedBox(height: defaultSize * 1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextSmall(title: 'Due - Wed (Tomorrow)', color: kBlack50),
            ],
          ),
    
          // Class Title
          SizedBox(height: defaultSize * .5),
          buildCardHeader(title: clas.title),

          SizedBox(height: defaultSize),
          buildAvatarAndName(
              avatar: clas.educator.avatar,
              name: clas.educator.fullName,
              fontSize: defaultSize * 1.6,
              weight: FontWeight.w600),

          // Description Label
          // CardDescription(label: "Description", content: data.description),
          SizedBox(height: defaultSize),
          TextMedium(title: clas.description, color: kBlack70),

          // Info Cards
          SizedBox(height: defaultSize * 2),
    
        ],
      ),
    );
  }
}
