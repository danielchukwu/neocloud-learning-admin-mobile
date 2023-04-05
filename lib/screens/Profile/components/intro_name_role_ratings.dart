import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/students.dart';
import 'package:neocloud_mobile/utils.dart';

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
            title: user.fullName,
            color: kBlack80,
            weight: FontWeight.w600,
          ),
          // User Role
          TextMedium(title: "NCT " + user.role, color: kBlack70),
          // User Ratings
          Row(
            children: getRatings(rating: user.ratings),
          ),
        ],
      ),
    );
  }
}

// returns a list containing star widgets mixture, both full_stars,
// half_stars, and empty_stars
List<Widget> getRatings({required double rating}) {
  Map ratingsMap = getStarsForRating(ratings: rating);
  List<Widget> result = [];

  // Add full stars
  addRatingIcon(count: ratingsMap['full_stars'], icon: Icons.star, list: result);
  // Add half stars
  addRatingIcon(count: ratingsMap['half_stars'], icon: Icons.star_half, list: result);
  // Add empty stars
  addRatingIcon(count: ratingsMap['empty_stars'], icon: Icons.star_outline, list: result);

  // Add ratings text. e.g (4.7 stars)
  double convertedRatings = rating / 20;
  result.add(TextMedium(title: " (${convertedRatings} stars)", color: kBlack70,));

  return result;
}

// Add a specified icon <icon>, n-times <count> into the Array ds <list>
void addRatingIcon({
  required int count,
  required List<Widget> list,
  required IconData icon,
}) {
  for (int i = 0; i < count; i++) {
    list.add(Icon(icon, color: Color(0XFFF7AC16)));
  }
}