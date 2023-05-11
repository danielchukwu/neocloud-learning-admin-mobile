import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class FacultyList extends StatelessWidget {
  const FacultyList({
    super.key,
    required this.data,
  });

  final List<FacultyOld> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(data.length, (index) => FacultyCard(data: data[index])),
        );
  }
}