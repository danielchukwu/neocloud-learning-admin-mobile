import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/syllabus_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class SyllabusList extends StatelessWidget {
  const SyllabusList({
    super.key,
    required this.data,
  });

  final List<Syllabus> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(data.length, (index) => SyllabusCard(data: data[index])),
    );
  }
}