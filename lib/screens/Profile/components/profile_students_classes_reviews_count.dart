import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/class_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/list/list_screen.dart';

class ProfileStudentsClassesReviewsCount extends StatelessWidget {
  const ProfileStudentsClassesReviewsCount({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    List<Map> iconTextRowList = [
      {
        'title': 'Students',
        'icon': Icons.supervisor_account,
        'count': 23,
        'widget': UserList(),
        'padding': true
      },
      {
        'title': 'Classes',
        'icon': Icons.menu,
        'count': 2,
        'widget': ClassList(showClassAvatar: true),
        'padding': false
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        iconTextRowList.length,
        (index) => GestureDetector(
          // onTap: () => navigateToListScreen(context: context, screenName: iconTextRowList[index]['title'], widgetList: iconTextRowList[index]['widget']),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListScreen(
                  screenName: iconTextRowList[index]['title'],
                  widgetList: iconTextRowList[index]['widget'],
                  addScreenPadding: iconTextRowList[index]['padding'],
                ),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * .5),
            child: IconText(
                title:
                    "${iconTextRowList[index]['title']} (${iconTextRowList[index]['count']})",
                icon: iconTextRowList[index]['icon'],
                iconColor: kBlack70,
                fontSize: defaultSize * 1.5),
          ),
        ),
      ),
    );
  }
}
