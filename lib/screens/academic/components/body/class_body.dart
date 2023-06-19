import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards.dart';
import 'package:neocloud_mobile/models/Class.dart';

class ClassBody extends StatelessWidget {
  const ClassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Cards
        Column(
          children: List.generate(
            classesList.length,
            (index) => ClassCard(
              clas: classesList[index],
              showClassAvatar: false,
            ),
          ),
        ),
      ],
    );
  }
}
