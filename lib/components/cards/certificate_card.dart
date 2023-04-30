import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/label_text.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    required this.data,
  });

  final Certificate data;

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
          CardHeader(label: "Full Name", title: data.fullName),

          // label: text
          SizedBox(height: defaultSize * 2),
          LabelText(label: "Faculty", text: data.faculty),
          LabelText(label: "Department", text: data.department),
          LabelText(label: "AccessId", text: data.accessId),
          LabelText(label: "Certificate No", text: '${data.certificateNo}'),
          LabelText(label: "Issues On", text: data.issuesOn),


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