import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/reviews_list.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key, required this.reviews});
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Reviews Header
        TextLarge(
          title: "Reviews",
          weight: FontWeight.w600,
          color: kBlack80,
        ),

        // List of Reviews
        ReviewsList(reviewsList: reviews.sublist(0, 3)),

        // See All {Count} Reviews
        SizedBox(height: reviews.length > 3 ? (defaultSize * 2) : 0),
        reviews.length > 3
            ? TextLink(
                title: "See All ${reviews.length} Reviews",
                press: (context) => navigateToListScreen(
                  context: context,
                  screenName: 'Reviews',
                  widgetList: ReviewsList(reviewsList: reviews),
                ),
                color: kBlue,
                weight: FontWeight.w600,
                fontSize: defaultSize * 1.6,
              )
            : SizedBox(),
      ],
    );
  }
}
