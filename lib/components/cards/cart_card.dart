import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

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
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Cart Image
            buildCartImage(),

            // Item Details
            const SizedBox(width: 20),
            buildCartInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildCartInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          TextExtraLarge(
              title: course.title, weight: FontWeight.w600, color: kBlack80),

          // Educator
          const SizedBox(height: 5),
          TextSmall(
            title: course.user.fullName,
            color: kBlack50,
          ),

          // {percentage} discount
          const SizedBox(height: 5),
          TextSmall(
            title: "${course.discount}% discount",
            color: kBlack70,
            weight: FontWeight.w500,
          ),

          // Price
          const SizedBox(height: 5),
          AppsTextRich(
            text1: "N ${getMoneyFormat(course.price)}",
            text2:
                "  NGN ${getMoneyFormat(course.price - (course.price * (course.discount ?? 0 / 100)))}",
            text1FontSize: 14,
            text1Decoration: TextDecoration.lineThrough,
            text2FontWeight: FontWeight.w600,
            text2Color: kBlack80,
          ),

          // Move to / Remove
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Move to
              TextLink(
                title: "Move to wishlist",
                press: (context) => print("Move to wishlist clicked ..."),
                color: kBlue,
                weight: FontWeight.w500,
              ),

              // Remove
              const SizedBox(width: 40),
              TextLink(
                title: "Remove",
                press: (context) => print("Remove clicked ..."),
                color: kBlue,
                weight: FontWeight.w500,
              ),
            ],
          ),

          // Purchase
          const SizedBox(height: 20),
          AppsButton(
            title: "Purchase",
            press: (_) => print("Purchase Button clicked ..."),
            padTopBottom: 3,
            bgColor: kBlack80,
            borderRadius: 5,
          )
        ],
      ),
    );
  }

  Container buildCartImage() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(course.avatar), fit: BoxFit.cover)),
    );
  }
}
