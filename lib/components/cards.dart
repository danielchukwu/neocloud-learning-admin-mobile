import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/ratings.dart';
import 'package:neocloud_mobile/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/class/class_screen.dart';
import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.clas,
    this.allowSeeMore = false,
    this.bodySeperationSize = 10,
    this.enableGestureDecorator = true,
    this.showClassAvatar = true,
  });

  final Class clas;
  final bool allowSeeMore;
  final double bodySeperationSize;
  // we use this because we use this card in the class screen and
  // we don't want to be able to click on the card when used in that screen
  final bool enableGestureDecorator;

  final bool showClassAvatar;

  @override
  Widget build(BuildContext context) {
    List<Map> tabletData = [
      {'value': clas.faculty.title, 'color': kOrange},
      {'value': '${clas.hod.fullName} (HOD)', 'color': kGreen},
    ];

    return GestureDetector(
      onTap: enableGestureDecorator
          ? () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ClassScreen(),
              ))
          : () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Course Image
          showClassAvatar
              ? RectangularBoxImage(img: clas.avatar, height: defaultSize * 22)
              : SizedBox(),

          // Course Body - Title, tutor, price
          SizedBox(height: bodySeperationSize),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TextCustom(
                  title: clas.title,
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
                    SizedBox(height: defaultSize),
                    buildAvatarAndName(
                        avatar: clas.educator.avatar,
                        name: clas.educator.fullName,
                        fontSize: defaultSize * 1.6,
                        weight: FontWeight.w600),

                    // Ratings
                    const Spacer(),
                    TextMedium(
                      title: getRatingFormat(clas.rating),
                      weight: FontWeight.w600,
                    ),
                    SizedBox(width: defaultSize * .5),
                    Icon(
                      Icons.star_rounded,
                      color: kStarColor,
                      size: defaultSize * 2,
                    ),
                  ],
                ),

                // Class Description
                SizedBox(height: defaultSize * 1.5),
                allowSeeMore
                    ? TextSeeMore(
                        text: clas.about,
                        color: kBlack70,
                        fontSize: defaultSize * 1.6,
                        maxLines: 3,
                      )
                    : TextCustomMaxLine(
                        title: clas.about,
                        color: kBlack70,
                        fontSize: defaultSize * 1.6,
                        maxLines: 3,
                      ),

                // Bottom Tablets
                SizedBox(height: defaultSize * 2),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    tabletData.length,
                    (index) => TextColorTablet(
                      title: '${tabletData[index]['value']}',
                      bgColor: tabletData[index]['color'],
                    ),
                  ),
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
                  image: DecorationImage(
                      image: AssetImage(course.avatar), fit: BoxFit.cover)),
            ),

            // Item Details
            SizedBox(width: defaultSize * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title
                  TextExtraLarge(
                      title: course.title,
                      weight: FontWeight.w600,
                      color: kBlack80),

                  // Educator
                  SizedBox(height: defaultSize * .5),
                  TextSmall(
                    title: course.user.fullName,
                    color: kBlack50,
                  ),

                  // {percentage} discount
                  SizedBox(height: defaultSize * .5),
                  TextSmall(
                    title: "${course.discount}% discount",
                    color: kBlack70,
                    weight: FontWeight.w500,
                  ),

                  // Price
                  SizedBox(height: defaultSize * .5),
                  AppsTextRich(
                    text1: "N ${getMoneyFormat(course.price)}",
                    text2:
                        "  NGN ${getMoneyFormat(course.price - (course.price * (course.discount ?? 0 / 100)))}",
                    text1FontSize: defaultSize * 1.4,
                    text1Decoration: TextDecoration.lineThrough,
                    text2FontWeight: FontWeight.w600,
                    text2Color: kBlack80,
                  ),

                  // Move to / Remove
                  SizedBox(height: defaultSize * 1.5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Move to
                      TextLink(
                        title: "Move to wishlist",
                        press: (context) =>
                            print("Move to wishlist clicked ..."),
                        color: kBlue,
                        weight: FontWeight.w500,
                      ),

                      // Remove
                      SizedBox(width: defaultSize * 4),
                      TextLink(
                        title: "Remove",
                        press: (context) => print("Remove clicked ..."),
                        color: kBlue,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),

                  // Purchase
                  SizedBox(height: defaultSize * 2),
                  AppsButton(
                    title: "Purchase",
                    press: (_) => print("Purchase Button clicked ..."),
                    padTopBottom: defaultSize * .3,
                    bgColor: kBlack80,
                    borderRadius: defaultSize * .5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
