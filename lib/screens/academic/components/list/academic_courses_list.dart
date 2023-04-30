import 'package:flutter/material.dart';
import 'package:neocloud_mobile/screens/academic/components/cards/academic_course_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class AcademicCoursesList extends StatelessWidget {
  const AcademicCoursesList({
    super.key,
    required this.data,
  });

  final List<AccademicCourse> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(data.length, (index) => AcademicCourseCard(data: data[index])),
        );
  }
}