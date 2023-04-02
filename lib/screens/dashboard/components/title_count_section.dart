import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class TitleCountSection extends StatelessWidget {
  final String title;
  final String count;
  final Function(BuildContext context) press;

  const TitleCountSection({
    super.key,
    required this.title,
    required this.count,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Item Header
        buildSectionHeader(context),

        // Item content
        TextCustom(
          title: count,
          fontSize: defaultSize * 5,
          color: kWhite,
          weight: FontWeight.w300,
        )
      ],
    );
  }

  Row buildSectionHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextLarge(
          title: title,
          color: kWhite,
          weight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: () => press(context),
          child: TextMedium(
            title: 'See List',
            color: kWhite.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
