import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/label_text.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class BookIssueCard extends StatelessWidget {
  const BookIssueCard({
    super.key,
    required this.data,
  });

  final BookIssue data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cardTopMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          // Card Into
          CardHeader(label: "Book Issue", title: data.book),

          // label: text
          LabelText(label: "Class", text: data.clas),
          LabelText(label: "Student", text: data.student),
          LabelText(label: "Issued", text: data.createdAt),

          // Round Image and Name
          SizedBox(height: defaultSize * 2),
          buildAvatarAndName(avatar: data.avatar, name: data.educator),
          
        ],
      ),
    );
  }
}