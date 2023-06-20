import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/ratings.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // name
        SizedBox(height: defaultSize * 2),
        TextLarge(
          title: review.name,
          weight: FontWeight.w500,
          color: kBlack80,
        ),

        // ratings
        SizedBox(height: defaultSize * .5),
        Ratings(
            rating: review.rating,
            reviewsCount: 0,
            iconSize: defaultSize * 2,
            showReviews: false,
            showRatingsText: false),

        // content
        SizedBox(height: defaultSize * .5),
        TextMedium(title: review.content, color: kBlack70),
      ],
    );
  }
}
