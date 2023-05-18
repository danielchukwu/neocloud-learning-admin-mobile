import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/models/Class.dart';

import 'package:neocloud_mobile/models/card_data.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    super.key,
    required this.clas,
  });

  final List<Class> clas;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
          List.generate(clas.length, (index) => ClassCard(clas: clas[index])),
    );
  }
}