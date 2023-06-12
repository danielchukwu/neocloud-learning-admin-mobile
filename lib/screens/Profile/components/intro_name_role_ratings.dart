import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/ratings.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // User Name
          TextExtraLarge(
              title: user.fullName, color: kBlack80, weight: FontWeight.w600),

          // User Role
          SizedBox(height: defaultSize * .3),
          TextMedium(title: user.role[0], color: kBlack50),

          // User Ratings
          SizedBox(height: defaultSize * .5),
          Ratings(rating: user.ratings, reviewsCount: user.reviews_count, fontSize: defaultSize * 1.6, alignCenter: true,)
        ],
      ),
    );
  }
}
