import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/screens/class/class_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';
import 'package:skeletons/skeletons.dart';

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

  final ClassEntity clas;
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
                  bottom: appsBorder(context),
                ),
              )
            : const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Course Image
            showClassAvatar
                ? RectangularBoxImage(
                    img: clas.avatar ?? '', height: defaultSize * 22)
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
                    title: clas.name!,
                    fontSize: defaultSize * 2.2,
                    color: Theme.of(context).canvasColor.withOpacity(.8),
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
                        child: CircularAvartarAndName(
                            avatar: clas.educators != null && clas.educators!.length > 0 
                              ? clas.educators![0].avatar : '',
                            name: clas.educators != null && clas.educators!.length > 0 
                              ? clas.educators![0].name : 'daniel',
                            fontSize: defaultSize * 1.6,
                            weight: FontWeight.w600),
                      ),

                      // Ratings
                      TextMedium(
                        title: getRatingFormat(50),
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
                          text: clas.about ?? '',
                          color: Theme.of(context).canvasColor.withOpacity(.7),
                          fontSize: defaultSize * 1.6,
                          maxLines: 2,
                        )
                      : TextCustomMaxLine(
                          title: clas.about ?? '',
                          color: Theme.of(context).canvasColor.withOpacity(.7),
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


class ClassCardSkeleton extends StatelessWidget {
  const ClassCardSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover
          const SkeletonLine(
            style: SkeletonLineStyle(height: 220),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 18,
                      width: 200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),

                // Row (Avatar, Name)
                const SizedBox(height: 17),
                Row(
                  children: const [
                    // avatar
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: 30,
                        height: 30,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),

                    // name
                    SizedBox(width: 18),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 14,
                          width: 120,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),

                // Description
                const SizedBox(height: 17),
                const SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                const SizedBox(height: 10),
                const SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                const SizedBox(height: 10),

                const SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 12,
                      width: 140,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),

                // Tablets (Faculty, Hod)
                const SizedBox(height: 20),
                Row(
                  children: const [
                    // Faculty
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 30,
                          width: 100,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                    // Hod
                    SizedBox(width: 10),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 30,
                          width: 120,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

