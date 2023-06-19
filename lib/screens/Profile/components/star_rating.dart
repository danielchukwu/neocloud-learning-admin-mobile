import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/utils.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating, required this.iconSize});

  final double rating;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(children: getRatings(rating: rating, iconSize: iconSize));
  }

  // returns a list containing star widgets mixture, both full_stars, half_stars, and empty_stars
  List<Widget> getRatings({required double rating, required double iconSize}) {
    Map ratingsMap = getStarsForRating(ratings: rating);
    List<Widget> result = [];

    // Add full stars
    addRatingIcon(
        count: ratingsMap['full_stars'],
        icon: Icons.star,
        iconSize: iconSize,
        list: result);
    // Add half stars
    addRatingIcon(
        count: ratingsMap['half_stars'],
        icon: Icons.star_half,
        iconSize: iconSize,
        list: result);
    // Add empty stars
    addRatingIcon(
        count: ratingsMap['empty_stars'],
        icon: Icons.star_outline,
        iconSize: iconSize,
        list: result);

    return result;
  }

  // Add a specified icon <icon>, n-times <count> into the List <list>
  void addRatingIcon({
    required int count,
    required List<Widget> list,
    required IconData icon,
    required double iconSize,
  }) {
    for (int i = 0; i < count; i++) {
      list.add(Icon(
        icon,
        color: kStarColor,
        size: iconSize,
      ));
    }
  }
}
