import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassworksList extends StatelessWidget {
  const ClassworksList({Key? key, this.showFeedback = false}) : super(key: key);

  final bool showFeedback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(classWorksList.length, (index) => ClassWorkCard(clas: classWorksList[index], showFeedback: showFeedback),).toList(),
        ),
      ],
    );
  }
}
