import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class FacultyList extends StatelessWidget {
  const FacultyList({
    super.key,
    required this.faculty,
  });

  final List<Faculty> faculty;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(faculty.length, (index) => FacultyCard(faculty: faculty[index])),
        );
  }
}