import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

class ClassworksList extends StatelessWidget {
  const ClassworksList(
      {Key? key, required this.classworksList, this.showFeedback = false})
      : super(key: key);

  final bool showFeedback;
  final List<ClassWork> classworksList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        classWorksList.length,
        (index) => ClassWorkCard(
            clas: classWorksList[index], showFeedback: showFeedback),
      ).toList(),
    );
  }
}
