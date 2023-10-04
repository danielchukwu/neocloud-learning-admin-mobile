// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/screens/class/components/class_syllabus.dart';

// @RoutePage()
class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key, required this.clas});
  static String screenName = 'class';
  final ClassEntity clas;

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    var clas = widget.clas;

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        buildSliverAppBar(
          title: ClassScreen.screenName,
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
                bodySeparationSize: 15,
                enableGestureDecorator: false,
                showBottomBorder: false,
              ),

              Padding(
                padding: screenPadding,
                child: ClassSyllabus(modules: modulesList, classId: clas.id!),
              ),

              pageBottomPadding()
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kBlue,
        child: Icon(Icons.add, color: getColorOpposite(Theme.of(context).canvasColor),),
      ),
    );
  }
}
