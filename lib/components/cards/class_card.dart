import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/screens/class/class_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.clas,
    this.allowSeeMore = false,
    this.bodySeparationSize = 10,
    this.enableGestureDecorator = true,
    this.showClassAvatar = true,
    this.showBottomBorder = true,
  });

  final Class clas;
  final bool allowSeeMore;
  final double bodySeparationSize;
  // we use this because we use this card in the class screen and
  // we don't want to be able to click on the card when used in that screen
  final bool enableGestureDecorator;

  final bool showClassAvatar;
  final bool showBottomBorder;

  @override
  Widget build(BuildContext context) {
    List<Map> tabletData = [
      {'value': clas.faculty.title, 'color': kOrange},
      {'value': '${clas.hod.fullName} (HOD)', 'color': kGreen},
    ];

    return GestureDetector(
      onTap: enableGestureDecorator
          ? () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClassScreen(clas: clas),
              ))
          : () {},
      child: Container(
        decoration: showBottomBorder
            ? BoxDecoration(
                border: Border(
                  bottom: appsBorder,
                ),
              )
            : const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Course Image
            showClassAvatar
                ? RectangularBoxImage(
                    img: clas.avatar, height: defaultSize * 22)
                : SizedBox(),

            // Course Body - Title, tutor, price
            SizedBox(height: bodySeparationSize),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  TextCustom(
                    title: clas.title,
                    fontSize: defaultSize * 2.2,
                    color: kBlack80,
                    weight: FontWeight.w700,
                  ),

                  // Name and Ratings
                  SizedBox(height: defaultSize),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Name
                      SizedBox(height: defaultSize),
                      Expanded(
                        child: buildAvatarAndName(
                            avatar: clas.educator.avatar,
                            name: clas.educator.fullName,
                            fontSize: defaultSize * 1.6,
                            weight: FontWeight.w600),
                      ),

                      // Ratings
                      TextMedium(
                        title: getRatingFormat(clas.rating),
                        weight: FontWeight.w600,
                      ),
                      SizedBox(width: defaultSize * .5),
                      Icon(
                        Icons.star_rounded,
                        color: kStarColor,
                        size: defaultSize * 2,
                      ),
                    ],
                  ),

                  // Class Description
                  SizedBox(height: defaultSize * 1.5),
                  allowSeeMore
                      ? TextSeeMore(
                          text: clas.about,
                          color: kBlack70,
                          fontSize: defaultSize * 1.6,
                          maxLines: 2,
                        )
                      : TextCustomMaxLine(
                          title: clas.about,
                          color: kBlack70,
                          fontSize: defaultSize * 1.6,
                          maxLines: 3,
                        ),

                  // Bottom Tablets
                  SizedBox(height: defaultSize * 2),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      tabletData.length,
                      (index) => TextColorTablet(
                        title: '${tabletData[index]['value']}',
                        bgColor: tabletData[index]['color'],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: defaultSize * 3),
          ],
        ),
      ),
    );
  }
}
