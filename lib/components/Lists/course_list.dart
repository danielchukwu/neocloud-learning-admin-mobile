import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/course_card.dart';
import 'package:neocloud_mobile/models/Courses.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({
    super.key,
    required this.coursesList,
  });

  final List<Course> coursesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(coursesList.length,
          (index) => CourseCard(course: coursesList[index])),
    );
  }
}
