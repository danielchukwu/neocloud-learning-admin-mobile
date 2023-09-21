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
        const SizedBox(height: 20),
        TextLarge(
          title: review.name,
          weight: FontWeight.w500,
          color: kBlack80,
        ),

        // ratings
        const SizedBox(height: 5),
        Ratings(
            rating: review.rating,
            reviewsCount: 0,
            iconSize: 20,
            showReviews: false,
            showRatingsText: false),

        // content
        const SizedBox(height: 5),
        TextMedium(title: review.content, color: kBlack70),
      ],
    );
  }
}
