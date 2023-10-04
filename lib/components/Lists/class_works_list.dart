import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/graphql/services/classwork_service.dart';

import '../widgets.dart';

class ClassworksList extends StatefulWidget {
  const ClassworksList({
    Key? key,
    this.classworkList,
    this.showFeedback = false,
    this.spinnerScreeMaxHeight
  }) : super(key: key);

  final List<ClassworkModel>? classworkList;
  final bool showFeedback;
  final double? spinnerScreeMaxHeight;

  @override
  State<ClassworksList> createState() => _ClassworksListState();
}

class _ClassworksListState extends State<ClassworksList> {
  var classworkService = ClassworkService();
  List<ClassworkModel>? dataList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (!mounted) return;

    if (widget.classworkList == null) {
      classworkService.getClassworks().then((classes) {
        setState(() {
          dataList = classes;
        });
      });
    } else {
      dataList = widget.classworkList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return dataList == null
        ? spinnerScreen(context: context, screenMaxHeight: widget.spinnerScreeMaxHeight)
        : dataList!.isEmpty
            ? nothingWasFoundScreen(context: context, screenMaxHeight: widget.spinnerScreeMaxHeight)
            : Column(
                children: List.generate(
                  dataList!.length,
                  (index) => ClassWorkCard(
                    classwork: dataList![index],
                    enableGestureDecorator: true,
                    showFeedback: false,
                  ),
                ),
              );
  }
}
