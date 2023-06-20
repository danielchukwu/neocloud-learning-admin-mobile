import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/review_card.dart';
import 'package:neocloud_mobile/models/Courses.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
    required this.reviewsList,
  });

  final List<Review> reviewsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(
        reviewsList.length,
        (index) => ReviewCard(
          review: reviewsList[index],
        ),
      ),
    );
  }
}
