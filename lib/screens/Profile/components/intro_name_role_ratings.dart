import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

class IntroNameRoleRatings extends StatelessWidget {
  const IntroNameRoleRatings({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // User Name
          TextExtraLarge(
              title: user.name, color: Theme.of(context).canvasColor.withOpacity(.8), weight: FontWeight.w600),

          // User Role
          const SizedBox(height: 5),
          TextMedium(
              title: user.role != null ? user.role!.name : 'role unassigned',
              color: Theme.of(context).canvasColor.withOpacity(.5))

          // User Ratings
          // SizedBox(height: 5),
          // Ratings(rating: user.ratings, reviewsCount: user.reviews_count, fontSize: 16, alignCenter: true,)
        ],
      ),
    );
  }
}
