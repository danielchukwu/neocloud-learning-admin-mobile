import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/course_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  static String screenName = 'Cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        showAction: false,
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart items
            SizedBox(height: defaultSize * 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(coursesList.length, (index) => CartCard(course: coursesList[index])),
            ),

            Divider(color: kBlack50, height: defaultSize * .2),

            // Wishlist items
            SizedBox(height: defaultSize * 2),
            TextExtraLarge(title: "Wishlist", color: kBlack80, weight: FontWeight.w500,),
            SizedBox(height: defaultSize * 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(2, (index) => CartCard(course: coursesList[index])),
            ),
          ],
        ),
      ),
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
