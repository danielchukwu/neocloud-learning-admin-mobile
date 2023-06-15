import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/course_list.dart';
import 'package:neocloud_mobile/components/Lists/reviews_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
// import 'package:neocloud_mobile/components/Lists/course_list.dart';
// import 'package:neocloud_mobile/components/Lists/reviews_list.dart';
// import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
// import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';
// import 'package:neocloud_mobile/screens/Profile/components/profile_card.dart';
// import 'package:neocloud_mobile/screens/course/components/reviews.dart';
// import 'package:neocloud_mobile/screens/list/list_screen.dart';

class ProfileStudentsClassesReviewsCount extends StatelessWidget {
  const ProfileStudentsClassesReviewsCount({
    super.key,
    required this.user,
  });

  final Account user;

  @override
  Widget build(BuildContext context) {
    List<Map> iconTextRowList = [
      {'title': 'students', 'icon': Icons.supervisor_account, 'count': 23, 'widget': UserList(usersList: users)},
      {'title': 'classes', 'icon': Icons.video_library, 'count': 2, 'widget': CoursesList(coursesList: coursesList)},
      {'title': 'reviews', 'icon': Icons.reviews_sharp, 'count': 33, 'widget': ReviewsList(reviewsList: reviewsList,)},
    ];

    return Padding(
      padding: screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          iconTextRowList.length, 
          (index) => GestureDetector(
            onTap: () => navigateToListScreen(context: context, screenName: iconTextRowList[index]['title'], widgetList: iconTextRowList[index]['widget']),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * .5),
              child: IconText(
                title: "${iconTextRowList[index]['title']} (${iconTextRowList[index]['count']})",
                icon: iconTextRowList[index]['icon'],
                iconColor: kBlack70,
                fontSize: defaultSize * 1.5),
            ),
          ),),
      ),
    );
  }
}