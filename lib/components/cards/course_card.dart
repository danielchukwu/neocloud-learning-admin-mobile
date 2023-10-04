import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

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
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),

                // Name and Ratings
                SizedBox(height: defaultSize * .5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Name
                    Text(course.user.fullName, style: Theme.of(context).textTheme.bodyMedium),
                    const Spacer(),
                    // Ratings
                    Text(getRatingFormat(course.rating), style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(width: defaultSize),
                    Icon(
                      Icons.star,
                      color: kOrange,
                    ),
                  ],
                ),

                // Price
                SizedBox(height: defaultSize * .5),
                Text(
                  "N ${getMoneyFormat(course.price)}",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),

          SizedBox(height: defaultSize * 3),
        ],
      ),
    );
  }
}
