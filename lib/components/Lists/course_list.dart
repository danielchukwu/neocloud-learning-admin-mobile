import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards.dart';
import 'package:neocloud_mobile/models/Courses.dart';


class CoursesList extends StatelessWidget {
  const CoursesList({
    super.key,
    required this.data,
  });

  final List<Course> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(data.length, (index) => CourseCard(course: data[index])),
        );
  }
}