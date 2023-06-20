import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/screens/class/components/class_syllabus.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key, required this.clas});
  static String screenName = 'Class';
  final Class clas;

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    var clas = widget.clas;

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
                bodySeparationSize: defaultSize * 1.5,
                enableGestureDecorator: false,
                showBottomBorder: false,
              ),

              Padding(
                padding: screenPadding,
                child: ClassSyllabus(modules: modulesList),
              ),

              pageBottomPadding()
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kBlue,
        child: Icon(Icons.add, color: kWhite),
      ),
    );
  }
}
