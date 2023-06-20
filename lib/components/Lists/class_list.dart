import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/models/Class.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
    required this.classList,
    this.showClassAvatar = false,
    this.bodySeparationSize = 15,
  }) : super(key: key);

  final List<Class> classList;
  final bool showClassAvatar;
  final double bodySeparationSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        classesList.length,
        (index) => ClassCard(
          clas: classList[index],
          showClassAvatar: showClassAvatar,
          bodySeparationSize: bodySeparationSize,
        ),
      ),
    );
  }
}
