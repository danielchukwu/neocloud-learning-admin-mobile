import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class CoursePerks extends StatefulWidget {
  const CoursePerks({
    super.key,
    required this.title,
    required this.list,
  });
  final String title;
  final List<String> list;

  @override
  State<CoursePerks> createState() => _CoursePerksState();
}

class _CoursePerksState extends State<CoursePerks> {
  bool showContent = true;
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: defaultSize * 3),
        HeaderWithDropdown(
          title: widget.title,
          press: () => setState(() => showContent = !showContent),
          showContent: showContent,
          weight: FontWeight.w600,
        ),

        // List of items (perks) e.g
        // .  You'll be well vast in automation
        SizedBox(height: showContent == true ? (defaultSize * .4) : 0),
        showContent == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(
                      // Perks List
                      widget.list.length > 3 && !showMore
                          ? 3
                          : widget.list.length,
                      (index) => buildListItem(index),
                    ) +
                    // See More
                    (widget.list.length > 3
                        ? <Widget>[
                            SizedBox(
                              height: defaultSize * 1,
                            ),
                            TextLink(
                              title: !showMore ? "See more" : "See less",
                              color: kBlue,
                              fontSize: defaultSize * 1.6,
                              weight: FontWeight.w600,
                              press: (_) =>
                                  setState(() => showMore = !showMore),
                            )
                          ]
                        : []),
              )
            : SizedBox(),
      ],
    );
  }

  Padding buildListItem(int index) {
    return Padding(
      padding: EdgeInsets.only(top: defaultSize),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(top: defaultSize * .6),
          child: Icon(Icons.circle, size: defaultSize * .8, color: kBlack50),
        ),
        SizedBox(
          width: defaultSize * 1.5,
        ),
        Expanded(
          child: TextSmall(title: widget.list[index], color: kBlack70),
        ),
      ]),
    );
  }
}
