import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/card_sections.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassScheduleCard extends StatelessWidget {
  const ClassScheduleCard({
    super.key,
    required this.data,
  });

  final ClassSchedule data;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Card Into
        buildCardHeader(title: data.title),

        // Subject and Teacher
        SizedBox(height: defaultSize * 1.5),
      ],
    );
  }
}