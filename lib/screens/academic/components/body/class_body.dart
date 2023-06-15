import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassBody extends StatelessWidget {
  const ClassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Cards
        Column(
          children: List.generate( classesList.length, (index) => ClassCard(clas: classesList[index])),
        ),
      ],
    );
  }
}
