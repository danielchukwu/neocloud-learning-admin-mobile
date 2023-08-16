// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

// @RoutePage()
class ClassWorkScreen extends StatelessWidget {
  const ClassWorkScreen({super.key, required this.classwork});
  static String screenName = 'classwork';

  final ClassworkModel classwork;

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
                classwork: classwork,
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
