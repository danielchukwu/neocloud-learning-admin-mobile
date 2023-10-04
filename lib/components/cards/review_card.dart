import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/ratings.dart';
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
        Text(review.name, style: Theme.of(context).textTheme.labelMedium),

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
        // TextMedium(title: review.content, color: Theme.of(context).canvasColor.withOpacity(.7)),
        Text(review.content, style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
