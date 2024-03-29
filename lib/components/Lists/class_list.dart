import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/services/class_service.dart';
import 'package:neocloud_mobile/components/widgets.dart';

class ClassList extends StatefulWidget {
  const ClassList({
    Key? key,
    this.classList,
    this.showClassAvatar = false,
    this.bodySeparationSize = 15,
    this.spinnerScreeMaxHeight,
  }) : super(key: key);

  final List<ClassModel>? classList;
  final bool showClassAvatar;
  final double bodySeparationSize;
  final double? spinnerScreeMaxHeight;

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  var classService = ClassService();
  List<ClassModel>? dataList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (!mounted) return;

    if (widget.classList == null) {
      classService.getClasses().then((classes) {
        setState(() {
          dataList = classes;
        });
      });
    } else {
      dataList = widget.classList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return dataList == null
        ? spinnerScreen()
        : dataList!.isEmpty
            ? nothingWasFoundScreen(screenMaxHeight: widget.spinnerScreeMaxHeight)
            : Column(
                children: List.generate(
                  dataList!.length,
                  (index) => ClassCard(
                    clas: dataList![index],
                    showClassAvatar: widget.showClassAvatar,
                    bodySeparationSize: widget.bodySeparationSize,
                  ),
                ),
              );
  }

  
}
