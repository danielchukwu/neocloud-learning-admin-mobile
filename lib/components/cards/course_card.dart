import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CourseScreen(course: course),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Course Image
          RectangularBoxImage(img: course.avatar, height: defaultSize * 22),

          // Course Body - Title, tutor, price
          SizedBox(height: defaultSize),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TextCustom(
                  title: course.title,
                  fontSize: defaultSize * 2.2,
                  color: kBlack80,
                  weight: FontWeight.w700,
                ),

                // Name and Ratings
                SizedBox(height: defaultSize * .5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Name
                    TextMedium(title: course.user.fullName, color: kBlack70),
                    const Spacer(),
                    // Ratings
                    TextMedium(title: getRatingFormat(course.rating)),
                    SizedBox(width: defaultSize),
                    Icon(
                      Icons.star,
                      color: kOrange,
                    ),
                  ],
                ),

                // Price
                SizedBox(height: defaultSize * .5),
                TextExtraLarge(
                  title: "N ${getMoneyFormat(course.price)}",
                  color: kBlack80,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),

          SizedBox(height: defaultSize * 3),
        ],
      ),
    );
  }
}
