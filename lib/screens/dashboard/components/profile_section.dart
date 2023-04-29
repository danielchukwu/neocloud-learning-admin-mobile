import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/dashboard/components/circle_avatar_text.dart';

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

  Row buildSectionHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextCustom(
          title: title,
          fontSize: defaultSize * 2.2,
          color: kBlack80,
          weight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: () => navigateToComingSoon(context: context),
          child: TextMedium(
            title: 'See all',
            color: kBlue,
          ),
        ),
      ],
    );
  }

  SingleChildScrollView buildSectionList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CircleAvatarAndText(
            text: 'Add',
            press: (context) => navigateToProfile(context: context),
          ),
          Row(
            children: List.generate(data.length, (index) {
              Account user = data[index];
              return CircleAvatarAndText(
                image: user.avatar,
                text: user.fullName,
                press: (context) => navigateToProfile(context: context),
              );
            }),
          ),
        ],
      ),
    );
  }

}
