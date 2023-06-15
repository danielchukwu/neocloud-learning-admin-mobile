import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/components/star_rating.dart';
import 'package:neocloud_mobile/utils.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    super.key,
    required this.rating,
    required this.reviewsCount,
    this.fontSize,
    this.iconSize,
    this.color,
    this.showReviews = true, 
    this.showRatingsText = true,
    this.alignCenter = false,
  });

  final double rating;
  final int reviewsCount;
  final double? fontSize;
  final double? iconSize;
  final Color? color;
  final bool showReviews;
  final bool showRatingsText;
  final bool alignCenter;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: alignCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        // Rating
        showRatingsText 
        ? TextCustom(
            title: getRatingFormat(rating),
            color: color ?? kBlack70,
            weight: FontWeight.w600,
            fontSize: fontSize ?? defaultSize * 1.6)
        : SizedBox(),

        // Stars
        SizedBox(width: showRatingsText ? defaultSize * .5 : 0),
        StarRating(rating: rating, iconSize: iconSize ?? defaultSize * 2.2),

      ],
    );
    ;
  }
}
