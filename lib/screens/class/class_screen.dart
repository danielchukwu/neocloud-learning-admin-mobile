import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards.dart';
// import 'package:neocloud_mobile/components/images.dart';
// import 'package:neocloud_mobile/components/tablets.dart';
// import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
// import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/class/components/class_syllabus.dart';
// import 'package:neocloud_mobile/screens/course/components/course_outline.dart';
// import 'package:neocloud_mobile/utils.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});
  static String screenName = 'Class';

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  var clas = classesList[0];

  @override
  Widget build(BuildContext context) {
    List<Map> tabletData = [
      {'value': clas.faculty.title, 'color': kOrange},
      {'value': clas.hod.fullName, 'color': kGreen},
    ];

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        buildSliverAppBar(
          title: ClassScreen.screenName,
          bgColor: kWhite,
          isDark: true,
          showLeading: true,
          showAction1: false,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Class Card
              ClassCard(
                  clas: clas,
                  allowSeeMore: true,
                  bodySeperationSize: defaultSize * 1.5,
                  enableGestureDecorator: false),

              Padding(
                padding: screenPadding,
                child: ClassSyllabus(modules: modulesList),
              ),

              pageBottomPadding()
            ],
          ),
        ),
      ]),
    );
  }
}
