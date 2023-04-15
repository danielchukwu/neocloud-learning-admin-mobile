import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/components/card_description.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/display_filename.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassWorkCard extends StatelessWidget {
  const ClassWorkCard({
    super.key,
    required this.data,
  });

  final ClassWork data;

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
      {"label": "Course", "title": data.course, "flex": 3},
      {"label": "Date", "title": data.date, "flex": 2},
    ];

    return Container(
      margin: cardTopMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          // Card Into
          CardHeader(label: "Class Work", title: data.title),

          // Description Label
          CardDescription(label: "Description", content: data.description),

          // Course and Date
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections),

          // Classworks Image or File name
          SizedBox(height: defaultSize * 3),
          buildImageOrFileName(file: data.file),

          // Download button
          SizedBox(height: defaultSize * 2),
          buildDownloadButton(press: (context) {}),

        ],
      ),
    );
  }
}
