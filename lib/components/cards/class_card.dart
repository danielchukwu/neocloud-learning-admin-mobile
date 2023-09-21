import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/screens/class/class_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

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

  final ClassModel clas;
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
      {'value': clas.faculty!.name, 'color': kOrange},
      {'value': '${clas.faculty!.hod!.name} (HOD)', 'color': kGreen},
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
                ? RectangularBoxImage(img: clas.avatar ?? '', height: 220)
                : const SizedBox(),

            // Course Body - Title, tutor, price
            SizedBox(height: bodySeparationSize),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  TextCustom(
                    title: clas.name,
                    fontSize: 22,
                    color: kBlack80,
                    weight: FontWeight.w700,
                  ),

                  // Name and Ratings
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Name
                      const SizedBox(height: 10),
                      Expanded(
                        child: buildAvatarAndName(
                            avatar: clas.educators != null &&
                                    clas.educators!.length > 0
                                ? clas.educators![0].avatar ?? ''
                                : '',
                            name: clas.educators != null &&
                                    clas.educators!.length > 0
                                ? clas.educators![0].name
                                : 'daniel',
                            fontSize: 16,
                            weight: FontWeight.w600),
                      ),

                      // Ratings
                      TextMedium(
                        title: getRatingFormat(50),
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star_rounded,
                        color: kStarColor,
                        size: 20,
                      ),
                    ],
                  ),

                  // Class Description
                  const SizedBox(height: 15),
                  allowSeeMore
                      ? TextSeeMore(
                          text: clas.about ?? '',
                          color: kBlack70,
                          fontSize: 16,
                          maxLines: 2,
                        )
                      : TextCustomMaxLine(
                          title: clas.about ?? '',
                          color: kBlack70,
                          fontSize: 16,
                          maxLines: 3,
                        ),

                  // Bottom Tablets
                  const SizedBox(height: 20),
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

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
