import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/course_list.dart';
import 'package:neocloud_mobile/components/Lists/reviews_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_card.dart';
import 'package:neocloud_mobile/screens/course/components/reviews.dart';
import 'package:neocloud_mobile/screens/list/list_screen.dart';

class ProfileCardsList extends StatelessWidget {
  const ProfileCardsList({
    super.key,
    required this.user,
  });

  final Account user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ProfileCard(
              title: "Students",
              count: user.students_count,
              press: () => navigateToListScreen(context: context, screenName: "Students", widgetList: UserList(usersList: users)),
              bgColor: kOrange),
          SizedBox(width: defaultSize * 1.5),
          ProfileCard(
              title: "Courses",
              count: user.courses_count,
              press: () => navigateToListScreen(context: context, screenName: "Students", widgetList: CoursesList(coursesList: coursesList)),
              bgColor: kBlack80),
          SizedBox(width: defaultSize * 1.5),
          ProfileCard(
              title: "Reviews",
              count: user.reviews_count,
              press: () => navigateToListScreen(context: context, screenName: "Students", widgetList: ReviewsList(reviewsList: reviewsList,)),
              bgColor: kBlue),
        ],
      ),
    );
  }
}
