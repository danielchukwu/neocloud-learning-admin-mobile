import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/ratings.dart';
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
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Course Image
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
          ),

          SizedBox(height: defaultSize * 3),
        ],
      ),
    );
  }
}

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
                    image: AssetImage(course.imgSrc), fit: BoxFit.cover),
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
              reviewsCount: course.reviews_count,
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


class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // name
        SizedBox(height: defaultSize * 2),
        TextLarge(
          title: review.name,
          weight: FontWeight.w500,
          color: kBlack80,
        ),

        // ratings
        SizedBox(height: defaultSize * .5),
        Ratings(
            rating: review.rating,
            reviewsCount: 0,
            iconSize: defaultSize * 2,
            showReviews: false,
            showRatingsText: false),

        // content
        SizedBox(height: defaultSize * .5),
        TextMedium(title: review.content, color: kBlack70),
      ],
    );
  }
}


class CartCard extends StatelessWidget {
  const CartCard({
    super.key, required this.course,
  });
  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: 
      (_) => CourseScreen(course: course),),),
      child: Padding(
        padding: EdgeInsets.only(bottom: defaultSize * 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image
            Container(
              height: defaultSize * 7,
              width: defaultSize * 7,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(course.imgSrc), fit: BoxFit.cover)
              ),
            ),
      
            // Item Details
            SizedBox(width: defaultSize * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title
                  TextExtraLarge(title: course.title, weight: FontWeight.w600, color: kBlack80),
            
                  // Educator
                  SizedBox(height: defaultSize * .5),
                  TextSmall(title: course.user.fullName, color: kBlack50,),
            
                  // {percentage} discount
                  SizedBox(height: defaultSize * .5),
                  TextSmall(title: "${course.discount}% discount", color: kBlack70, weight: FontWeight.w500,),
                  
                  // Price
                  SizedBox(height: defaultSize * .5),
                  AppsTextRich(text1: "N ${getMoneyFormat(course.price)}", text2: "  NGN ${getMoneyFormat(course.price - (course.price * (course.discount / 100)))}", text1FontSize: defaultSize * 1.4, text1Decoration: TextDecoration.lineThrough, text2FontWeight: FontWeight.w600, text2Color: kBlack80,),
      
                  // Move to / Remove
                  SizedBox(height: defaultSize * 1.5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Move to
                      TextLink(title: "Move to wishlist", press: (context) => print("Move to wishlist clicked ..."), color: kBlue, weight: FontWeight.w500,),
      
                      // Remove
                      SizedBox(width: defaultSize * 4),
                      TextLink(title: "Remove", press: (context) => print("Remove clicked ..."), color: kBlue, weight: FontWeight.w500,),
                    ],
                  ),
            
                  // Purchase
                  SizedBox(height: defaultSize * 2),
                  AppsButton(title: "Purchase", press: (_) => print("Purchase Button clicked ..."), padTopBottom: defaultSize * .3, bgColor: kBlack80, borderRadius: defaultSize * .5,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
