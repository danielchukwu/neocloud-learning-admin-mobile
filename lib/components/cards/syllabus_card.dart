import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class SyllabusCard extends StatelessWidget {
  const SyllabusCard({
    super.key,
    required this.data,
  });

  final Syllabus data;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: cardBottomMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Into
          CardHeader(label: "Class", title: data.clas),

          // label & Data
          SizedBox(height: defaultSize * 2),
          buildLabelAndText(label: "Title", text: data.title),

          // label & Data
          SizedBox(height: defaultSize * 2),
          buildLabelAndText(label: "Subject", text: data.subject),

          // Display image or file
          SizedBox(height: defaultSize * 2),
          buildImageOrFileName(file: data.file),

          // Download button
          SizedBox(height: defaultSize * 2),
          buildDownloadButton(press: (context) {}),
        ],
      ),
    );
  }
}