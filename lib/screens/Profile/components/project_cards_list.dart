import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/students.dart';
import 'package:neocloud_mobile/screens/Profile/components/project_card.dart';

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
              press: () {},
              bgColor: kOrange),
          SizedBox(width: defaultSize * 1.5),
          ProfileCard(
              title: "Courses",
              count: user.courses_count,
              press: () {},
              bgColor: kBlack80),
          SizedBox(width: defaultSize * 1.5),
          ProfileCard(
              title: "Reviews",
              count: user.reviews_count,
              press: () {},
              bgColor: kBlue),
        ],
      ),
    );
  }
}
