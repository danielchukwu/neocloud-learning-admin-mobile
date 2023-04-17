import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';

import 'package:neocloud_mobile/models/card_data.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    super.key,
    required this.data,
  });

  final List<Class> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(data.length, (index) => ClassCard(data: data[index])),
    );
  }
}
