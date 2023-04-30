import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/utils.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.data,
  });

  final Book data;

  @override
  Widget build(BuildContext context) {
    String bigText = "${data.availableCopies} Book ";
    String smallText = "${getPluralOrSingular(count: int.parse(data.availableCopies), word: "copies",)}";

    return Container(
      margin: cardBottomMargin,
      padding: cardPadding,
      decoration: buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Into
          CardHeader(label: "Book", title: data.title),

          // Student count
          SizedBox(height: defaultSize * .5),
          TextBigSmall(bigText: bigText, smallText: smallText),

          // Round Image and
          SizedBox(height: defaultSize * 2),
          buildAvatarAndName(avatar: data.avatar, name: data.educator),
        ],
      ),
    );
  }
}