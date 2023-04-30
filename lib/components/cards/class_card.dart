import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/label_text.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.data,
  });

  final Class data;

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
          CardHeader(label: "Name", title: data.name),

          // label: text
          SizedBox(height: defaultSize * 2),
          LabelText(label: "Faculty", text: data.faculty),
          LabelText(label: "Class", text: data.clas),
        ],
      ),
    );
  }
}