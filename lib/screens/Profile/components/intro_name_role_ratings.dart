import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/components/star_rating.dart';

class IntroNameRoleRatings extends StatelessWidget {
  const IntroNameRoleRatings({
    super.key,
    required this.user,
  });

  final Account user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // User Name
          TextExtraLarge(
              title: user.fullName, color: kBlack80, weight: FontWeight.w600),

          // User Role
          TextMedium(title: "NCT " + user.role, color: kBlack70),

          // User Ratings
          SizedBox(height: defaultSize * .3),
          Row(
            children: [
              StarRating(rating: user.ratings, iconSize: defaultSize * 2.4),
              TextMedium(
                title: " (${user.ratings / 20} stars)",
                color: kBlack70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
