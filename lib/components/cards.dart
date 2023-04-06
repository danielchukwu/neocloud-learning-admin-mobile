import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Course Image
          Container(
            margin: EdgeInsets.only(top: defaultSize * 2),
            height: defaultSize * 20,
            width: SizeConfig.screenWidth! - appsBodyPadding,
            decoration: BoxDecoration(
                color: kBlack.withOpacity(.2),
                image: DecorationImage(
                  image: AssetImage(course.imgSrc),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(height: defaultSize * 2),

          // Title
          TextCustom(
            title: course.title,
            fontSize: defaultSize * 2.2,
            color: kBlack80,
            weight: FontWeight.w700,
          ),
          SizedBox(height: defaultSize),

          // Name and Ratings
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextMedium(title: course.user.fullName, color: kBlack70),
              const Spacer(),
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
      ),
    );
  }
}
