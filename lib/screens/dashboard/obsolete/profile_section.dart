import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/dashboard/obsolete/circle_avatar_text.dart';

class ListProfileSection extends StatelessWidget {
  final String title;
  final List<Account> data;

  const ListProfileSection({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Section Header
        SizedBox(height: defaultSize * 3),
        buildSectionHeader(context),

        // Section Content - list of users (students, educators or admin)
        SizedBox(height: defaultSize * 2),
        buildSectionList(),

        // Section Count - total users count
        SizedBox(height: defaultSize * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextSmall(title: '${data.length - 2}+ $title', color: kBlack60),
          ],
        )
      ],
    );
  }

  Widget buildSectionHeader(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextCustom(
            title: title,
            fontSize: defaultSize * 2.2,
            color: kBlack80,
            weight: FontWeight.w600,
          ),
          TextLink(title: "See all", color: kBlue, press: (_) => navigateToListScreen(context: context, screenName: title, widgetList: UserList(usersList: users)),)
        ],
      ),
    );
  }

  SingleChildScrollView buildSectionList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: defaultSize * 2, right: defaultSize),
            child: CircleAvatarAndText(
              text: 'Add',
              press: (context) => navigateToScreenPush(context: context, widget: const ComingSoonScreen()),
            ),
          ),
          Row(
            children: List.generate(data.length, (index) {
              Account user = data[index];
              return Padding(
                padding: EdgeInsets.only(right: defaultSize),
                child: CircleAvatarAndText(
                  image: user.avatar,
                  text: user.fullName,
                  press: (context) => navigateToScreenPush(context: context, widget: ProfileScreen(user: user)),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

}
