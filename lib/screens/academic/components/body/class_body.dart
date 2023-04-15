import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/class_list.dart';

class ClassBody extends StatelessWidget {
  const ClassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Button and List of CARDS
        SizedBox(height: defaultSize * 3),
        ClassList(data: classesList),
      ],
    );
  }
}
