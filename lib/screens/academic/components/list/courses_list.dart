import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/courses_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({
    super.key,
    required this.data,
  });

  final List<Course> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(data.length, (index) => CoursesCard(data: data[index])),
        );
  }
}