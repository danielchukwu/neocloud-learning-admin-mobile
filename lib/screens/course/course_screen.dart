import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/ratings.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/cart/cart_screen.dart';
import 'package:neocloud_mobile/screens/course/components/course_outline.dart';
import 'package:neocloud_mobile/screens/course/components/course_perks.dart';
import 'package:neocloud_mobile/screens/course/components/educator_info.dart';
import 'package:neocloud_mobile/screens/course/components/reviews.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key, required this.course}) : super(key: key);
  static String screenName = "Course";

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        buildSliverAppBar(
          title: "",
          bgColor: kWhite,
          isDark: true,
          showLeading: true,
          routeName1: getRouteName(CartScreen.screenName),
          actionIcon1: Icons.shopping_cart_outlined,
        ),
        
        SliverToBoxAdapter(
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
                    buildCourseImage(),
        
                    // Title
                    SizedBox(height: defaultSize * 1.5),
                    buildCourseTitle(),
        
                    // Ratings
                    SizedBox(height: defaultSize),
                    Ratings(
                        rating: course.rating,
                        reviewsCount: course.reviews_count ?? 0),
        
                    // Created by ....
                    SizedBox(height: defaultSize * .8),
                    buildCreatedBy(),
        
                    // Students count & reviews
                    SizedBox(height: defaultSize * .8),
                    buildStudentsCountAndReviews(),
        
                    // Duration
                    SizedBox(height: defaultSize * .8),
                    buildDuration(),
        
                    // Cost
                    SizedBox(height: defaultSize * 1.8),
                    buildCourseCost(),
        
                    // Buy Btn & Cart Btn
                    SizedBox(height: defaultSize * 1.8),
                    buildBuyCartButton(),
        
                    // What You'll Learn
                    CoursePerks(
                        title: "What you'll learn",
                        list: course.accomplishments ?? ['Loading']),
        
                    // Requirements
                    CoursePerks(
                        title: "Requirements",
                        list: course.requirements ?? ['Loading']),
        
                    // Course Outline
                    SizedBox(height: defaultSize * 3),
                    CourseOutline(modules: modulesList),
        
                    // Educator Info
                    SizedBox(height: defaultSize * 3),
                    EducatorInfo(user: course.user),
        
                    // Reviews
                    SizedBox(height: defaultSize * 5),
                    Reviews(reviews: reviewsList),
                  ],
                ),
              ),
        
              // Similar Courses
              SizedBox(height: defaultSize * 5),
              Padding(
                padding: screenPadding,
                child: TextLarge(
                  title: "Similar Courses",
                  weight: FontWeight.w600,
                  color: kBlack80,
                ),
              ),
        
              SizedBox(height: defaultSize * 2),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(
                        coursesList.length * 2,
                        (index) => buildSmallMiniCourseCard(
                            course: coursesList[index % 6]),
                      ) +
                      <Widget>[
                        SizedBox(
                          width: defaultSize * 2,
                        )
                      ],
                ),
              ),
              pageBottomPadding()
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildBuyCartButton() {
    return Row(
      children: <Widget>[
        // Buy now
        Expanded(
          child: AppsButton(
            title: "Buy now",
            padTopBottom: defaultSize * .6,
            press: (context) => {},
          ),
        ),

        // Wishlist
        SizedBox(width: defaultSize),
        SizedBox(
          width: defaultSize * 6,
          child: AppsIconButton(
            press: (BuildContext? context) {},
            icon: Icons.star_border_purple500_rounded,
            iconColor: kBlack70,
            padTopBottom: defaultSize * 1.5,
            padLeftRight: 0,
            bgColor: kBlack.withOpacity(.05),
          ),
        ),

        // Cart
        SizedBox(width: defaultSize),
        SizedBox(
          width: defaultSize * 6,
          child: AppsIconButton(
            press: (BuildContext? context) {},
            icon: Icons.add_shopping_cart_outlined,
            iconColor: kBlack70,
            padTopBottom: defaultSize * 1.5,
            padLeftRight: 0,
            bgColor: kBlack.withOpacity(.05),
          ),
        )
      ],
    );
  }

  Widget buildCourseCost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconText(
          svg: "assets/icons/naira_symbol.svg",
          title: getMoneyFormat(course.price),
          fontSize: defaultSize * 2.5,
          fontWeight: FontWeight.w600,
          color: kBlack80,
          iconColor: kBlack80,
        )
      ],
    );
  }

  Widget buildDuration() {
    return IconText(
      icon: Icons.phone_android,
      title:
          "${course.duration} ${getPluralOrSingular(count: course.duration!, word: 'hour')} on demand",
      fontSize: defaultSize * 1.6,
      color: kBlack70,
      iconColor: kBlack70,
    );
  }

  Widget buildStudentsCountAndReviews() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Students
        IconText(
          svg: 'assets/icons/account.svg',
          title:
              "${course.students_count} ${getPluralOrSingular(count: course.students_count!, word: 'student')}",
          fontSize: defaultSize * 1.6,
          color: kBlack70,
          iconColor: kBlack70,
        ),

        // Reviews in Percentage
        course.reviews_count != 0
            ? AppsTextRich(
                text1:
                    "${((course.reviews_count! / course.students_count!) * 100).toInt()}% ",
                text2: "left a review",
                text1Color: kGreen,
                text2Color: kBlack70,
                text1FontSize: defaultSize * 1.6,
                text2FontSize: defaultSize * 1.6,
                text1FontWeight: FontWeight.w600,
              )
            : TextMedium(title: "No reviews yet"),
      ],
    );
  }

  Widget buildCreatedBy() {
    return AppsTextRich(
      text1: "created by ",
      text2: "${course.user.fullName}",
      text1Color: kBlack50,
      text2Color: kBlue,
      text1FontSize: defaultSize * 1.6,
      text2FontSize: defaultSize * 1.6,
      text2FontWeight: FontWeight.w600,
    );
  }

  Widget buildCourseImage() {
    return Container(
      height: SizeConfig.screenWidth! / 1.8,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(course.avatar), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildCourseTitle() {
    return TextCustom(
        title: course.title,
        weight: FontWeight.w700,
        color: kBlack90,
        fontSize: defaultSize * 2.2);
  }
}
