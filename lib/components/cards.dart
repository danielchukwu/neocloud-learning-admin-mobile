import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/size_config.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Course Image
        SizedBox(height: defaultSize * 3),
        RectangularBoxImage(img: course.imgSrc, height: defaultSize * 20),

        // Title
        SizedBox(height: defaultSize * 2),
        TextCustom(
          title: course.title,
          fontSize: defaultSize * 2.2,
          color: kBlack80,
          weight: FontWeight.w700,
        ),

        // Name and Ratings
        SizedBox(height: defaultSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Name
            TextMedium(title: course.user.fullName, color: kBlack70),
            const Spacer(),
            // Ratings
            TextMedium(title: "${course.rating}"),
            SizedBox(width: defaultSize),
            Icon(
              Icons.star,
              color: kOrange,
            ),
          ],
        ),

        // Price
        SizedBox(height: defaultSize),
        TextLarge(
          title: "N ${course.price}",
          color: kBlack80,
          weight: FontWeight.w600,
        )
      ],
    );
  }
}
