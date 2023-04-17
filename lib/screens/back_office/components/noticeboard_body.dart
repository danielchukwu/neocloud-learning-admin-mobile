import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class NoticeboardBody extends StatelessWidget {
  const NoticeboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Class Button
        SizedBox(height: defaultSize * 3),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     buildAddButton(title: "Add Class", press: (context) {}),
        //   ],
        // ),
        //
        // // Cards
        SizedBox(height: defaultSize),
        // Column(
        //   children: List.generate(classesList.length, (index) => ClassCard(data: classesList[index])),
        // ),

        TextExtraLarge(title: "Coming Soon..."),

      ],
    );
  }
}
