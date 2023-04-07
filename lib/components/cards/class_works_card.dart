import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/components/card_description.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/display_filename.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/class_work.dart';

class ClassWorkCard extends StatelessWidget {
  const ClassWorkCard({
    super.key,
    required this.data,
  });

  final ClassWork data;

  @override
  Widget build(BuildContext context) {
    final sections = [
      {"label": "Course", "title": data.course, "flex": 2},
      {"label": "Date", "title": data.created_at, "flex": 1},
    ];

    return Container(
      margin: EdgeInsets.only(top: defaultSize * 2),
      padding: EdgeInsets.all(defaultSize * 2),
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Card Into
          CardIntro(label: "Class Work", title: data.title),

          // Description Label
          CardDescription(label: "Description", content: data.description),

          // Course and Date
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections),

          // Classworks Image or File name
          SizedBox(height: defaultSize * 3),
          getImageOrFileName(),

          // Download button
          SizedBox(height: defaultSize * 2),
          buildDownloadButton()
        ],
      ),
    );
  }

  Row buildDownloadButton() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Download Button
            AppsButton(
              title: "download",
              bgColor: kBlack80,
              padTopBottom: defaultSize * .5,
              icon: Icons.download,
              press: (context) {},
            ),
          ],
        );
  }

  BoxDecoration buildCardDecoration() {
    return BoxDecoration(
      border:
          Border.all(color: kBlack.withOpacity(.2), width: defaultSize * .1),
      borderRadius: BorderRadius.circular(defaultSize * 3),
    );
  }

  Widget getImageOrFileName() {
    if (data.file.contains(".jpg") || data.file.contains(".png")) {
      return RectangularBoxImage(img: data.file);
    } else {
      return DisplayFileName(title: data.file);
    }
  }
}
