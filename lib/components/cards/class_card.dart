import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.clas,
  });

  final Class clas;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2, vertical: defaultSize * 2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kBlack50, width: .2)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Class Title
          buildCardHeader(title: clas.title),

          // Educator {Avatar - Name}
          SizedBox(height: defaultSize),
          buildAvatarAndName(avatar: clas.educator.avatar, name: clas.educator.fullName, fontSize: defaultSize * 1.6, weight: FontWeight.w600),

          // About
          SizedBox(height: defaultSize * 1.5),
          TextCustomMaxLine(title: clas.about, fontSize: defaultSize * 1.6, color: kBlack70, maxLines: 3),

          // Info Cards
          SizedBox(height: defaultSize * 2),
          TextColorTablet(title: clas.faculty != null ? clas.faculty!.title : "faculty is null", bgColor: kOrange),
          SizedBox(height: defaultSize * .5),
        ],
      ),
    );
  }
}