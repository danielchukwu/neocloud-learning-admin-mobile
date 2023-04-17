import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/enquiry_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class EnquiriesBody extends StatelessWidget {
  const EnquiriesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Button
        SizedBox(height: defaultSize * 3),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     buildAddButton(title: "Add Class", press: (context) {}),
        //   ],
        // ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(enquiriesList.length, (index) => EnquiryCard(data: enquiriesList[index])),
        ),
      ],
    );
  }
}
