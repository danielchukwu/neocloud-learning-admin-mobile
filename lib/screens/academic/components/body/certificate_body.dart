import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/certificate_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';


class CertificateBody extends StatelessWidget {
  const CertificateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Certificate Button
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Certificate", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(certificatesList.length, (index) => CertificateCard(data: certificatesList[index])),
        ),
      ],
    );
  }
}
