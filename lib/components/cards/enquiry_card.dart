import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_description.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class EnquiryCard extends StatelessWidget {
  const EnquiryCard({
    super.key,
    required this.data,
  });

  final Enquiries data;

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
      {"label": "How you found us?", "title": data.howYouFoundUs, "flex": 1},
      {"label": "Date", "title": data.createdAt, "flex": 1},
    ];

    return Container(
      margin: cardTopMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          // Card Into
          CardHeader(label: "Enquiry", title: data.enquiry),

          // Description Label
          CardDescription(label: "Comment", content: data.comments),

          // How you found us | Date
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections, textOverflowLimit: 17),

        ],
      ),
    );
  }
}
