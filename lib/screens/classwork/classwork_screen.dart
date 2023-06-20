import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

class ClassWorkScreen extends StatelessWidget {
  const ClassWorkScreen({super.key, required this.classwork});
  static String screenName = 'Classwork';

  final ClassWork classwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        buildSliverAppBar(
          title: ClassWorkScreen.screenName,
          bgColor: kWhite,
          isDark: true,
          showLeading: true,
          showAction1: false,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClassWorkCard(
                clas: classwork,
                showFeedback: true,
                enableGestureDecorator: false,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
