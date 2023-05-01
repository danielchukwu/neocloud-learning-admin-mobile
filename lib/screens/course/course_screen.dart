import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/Profile/components/star_rating.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key, required this.course}) : super(key: key);
  static String screenName = "Course";

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "",
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        actionIcon: Icons.shopping_cart_outlined,
        routeName: getRouteName(ProfileScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image
            SizedBox(height: defaultSize),
            Padding(
              padding: screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image
                  Container(
                    height: SizeConfig.screenWidth! / 1.8,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(course.imgSrc), fit: BoxFit.cover),
                    ),
                  ),

                  // Title
                  SizedBox(height: defaultSize * 1.5),
                  TextCustom(
                      title: course.title,
                      weight: FontWeight.w700,
                      color: kBlack80,
                      fontSize: defaultSize * 2.2),

                  // Ratings
                  SizedBox(height: defaultSize),
                  Row(
                    children: <Widget>[
                      // Rating
                      TextMedium(
                          title: "${course.rating / 20}",
                          color: kBlack80,
                          weight: FontWeight.w600),

                      // Stars
                      SizedBox(width: defaultSize * .5),
                      StarRating(
                          rating: course.rating, iconSize: defaultSize * 2.4),

                      // Reviews Count
                      SizedBox(width: defaultSize * .5),
                      TextMedium(
                          title:
                              "(${course.reviews_count} ${getPluralOrSingular(count: course.reviews_count, word: 'review')})",
                          color: kBlack50)
                    ],
                  ),

                  // Created by ....
                  SizedBox(height: defaultSize * .8),
                  Text.rich(
                    TextSpan(
                      text: "created by ",
                      style: getAppsTextStyle(
                          color: kBlack50,
                          fontSize: defaultSize * 1.6,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: "${course.user.fullName}",
                          style: getAppsTextStyle(
                              color: kBlue, fontSize: defaultSize * 1.6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Students count & reviews

            // Duration

            // Cost

            // Buy Btn & Cart Btn

            // What You'll Learn

            // Requirements

            // Course Outline

            // About Educator

            // Reviews

            // Similar Courses
          ],
        ),
      ),
    );
  }
}
