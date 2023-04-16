import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/certificate_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class CertificateList extends StatelessWidget {
  const CertificateList({
    super.key,
    required this.data,
  });

  final List<Certificate> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Add Certificate Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Certificate", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => CertificateCard(data: data[index])),
        ),

      ],
    );
  }
}