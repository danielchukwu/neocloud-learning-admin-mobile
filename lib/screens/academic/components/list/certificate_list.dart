import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/certificate_card.dart';
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
          children: List.generate(data.length, (index) => CertificateCard(data: data[index])),
        );
  }
}