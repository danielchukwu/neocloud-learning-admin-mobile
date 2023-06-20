import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/ratings.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class MiniCourseCard extends StatelessWidget {
  const MiniCourseCard({
    super.key,
    required this.course,
    this.cardSize = 150,
    this.fontSize = 14,
    this.padLeftSpacing,
  });

  final Course course;
  final double cardSize;
  final double fontSize;
  final double? padLeftSpacing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => visitCourse(context),
      child: Container(
        padding: EdgeInsets.only(left: padLeftSpacing ?? defaultSize * 2),
        width: cardSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Course Image
            Container(
              width: cardSize,
              height: cardSize / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultSize * .4),
                image: DecorationImage(
                    image: AssetImage(course.avatar), fit: BoxFit.cover),
              ),
            ),

            // Course Title
            SizedBox(height: defaultSize),
            TextCustomMaxLine(
              title: course.title,
              fontSize: fontSize,
              color: kBlack80,
              maxLines: 3,
              lineHeight: 1.4,
              weight: FontWeight.w600,
            ),

            // Course Educator
            SizedBox(height: defaultSize * .5),
            TextCustomMaxLine(
              title: course.user.fullName,
              color: kBlack50,
              fontSize: fontSize - 2,
              maxLines: 1,
            ),

            // Ratings
            SizedBox(height: defaultSize * .5),
            Ratings(
              rating: course.rating,
              reviewsCount: course.reviews_count ?? 0,
              fontSize: fontSize - 2,
              iconSize: defaultSize * 1.6,
              showReviews: false,
              color: kBlack70,
            ),

            // Cost
            SizedBox(height: defaultSize * .5),
            TextCustom(
              title: "NGN ${getMoneyFormat(course.price)}",
              weight: FontWeight.w600,
              color: kBlack70,
              fontSize: fontSize,
            ),
          ],
        ),
      ),
    );
  }

  Future visitCourse(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CourseScreen(course: course),
      ),
    );
  }
}
