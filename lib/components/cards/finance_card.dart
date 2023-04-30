import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/components/cards/components/label_text.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard({
    super.key,
    required this.data,
  });

  final Finance data;

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
      {"label": "Total Amount", "title": "${data.totalAmount}", "flex": 1},
      {"label": "Paid Amount",   "title": "${data.paidAmount}", "flex": 1},
    ];

    return Container(
      margin: cardBottomMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Into
          CardHeader(label: "Invoice", title: data.title),

          // label: text
          SizedBox(height: defaultSize),
          LabelText(label: "Name", text: data.name),
          LabelText(label: "Class", text: data.clas),
          LabelText(label: "Status", text: data.status),

          // Dates
          SizedBox(height: defaultSize * 2),
          CardSections(data: sections, showLabel: true),

        ],
      ),
    );
  }
}
