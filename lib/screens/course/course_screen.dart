// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
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
import 'package:neocloud_mobile/utils/utils.dart';

// @RoutePage()
class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key, required this.course}) : super(key: key);
  static String screenName = "course";

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        AppsSliverAppBar(
          title: "",
          showLeading: true,
          routeName1: getRouteName(CartScreen.screenName),
          actionIcon1: Icons.shopping_cart_outlined,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image
              const SizedBox(height: 10),
              Padding(
                padding: screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Image
                    buildCourseImage(),

                    // Title
                    const SizedBox(height: 15),
                    buildCourseTitle(),

                    // Ratings
                    const SizedBox(height: 10),
                    Ratings(
                        rating: course.rating,
                        reviewsCount: course.reviews_count ?? 0),

                    // Created by ....
                    const SizedBox(height: 8),
                    buildCreatedBy(),

                    // Students count & reviews
                    const SizedBox(height: 8),
                    buildStudentsCountAndReviews(),

                    // Duration
                    const SizedBox(height: 8),
                    buildDuration(),

                    // Cost
                    const SizedBox(height: 18),
                    buildCourseCost(),

                    // Buy Btn & Cart Btn
                    const SizedBox(height: 18),
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
                    const SizedBox(height: 30),
                    CourseOutline(modules: modulesList),

                    // Educator Info
                    const SizedBox(height: 30),
                    EducatorInfo(user: course.user),

                    // Reviews
                    const SizedBox(height: 50),
                    Reviews(reviews: reviewsList),
                  ],
                ),
              ),

              // Similar Courses
              const SizedBox(height: 50),
              Padding(
                padding: screenPadding,
                child: TextLarge(
                  title: "Similar Courses",
                  weight: FontWeight.w600,
                  color: kBlack80,
                ),
              ),

              const SizedBox(height: 20),
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
                        const SizedBox(
                          width: 20,
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
            padTopBottom: 6,
            press: (context) => {},
          ),
        ),

        // Wishlist
        const SizedBox(width: 10),
        SizedBox(
          width: 60,
          child: AppsIconButton(
            press: (BuildContext? context) {},
            icon: Icons.star_border_purple500_rounded,
            iconColor: kBlack70,
            padTopBottom: 15,
            padLeftRight: 0,
            bgColor: kBlack.withOpacity(.05),
          ),
        ),

        // Cart
        const SizedBox(width: 10),
        SizedBox(
          width: 60,
          child: AppsIconButton(
            press: (BuildContext? context) {},
            icon: Icons.add_shopping_cart_outlined,
            iconColor: kBlack70,
            padTopBottom: 15,
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
          fontSize: 25,
          fontWeight: FontWeight.w600,
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
      fontSize: 16,
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
          fontSize: 16,
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
                text1FontSize: 16,
                text2FontSize: 16,
                text1FontWeight: FontWeight.w600,
              )
            : const TextMedium(title: "No reviews yet"),
      ],
    );
  }

  Widget buildCreatedBy() {
    return AppsTextRich(
      text1: "created by ",
      text2: course.user.fullName,
      text1Color: kBlack50,
      text2Color: kBlue,
      text1FontSize: 16,
      text2FontSize: 16,
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
        fontSize: 22);
  }
}
