import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/services/class_service.dart';
import 'package:neocloud_mobile/models/Class.dart';


class ClassList extends StatefulWidget {
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
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  var classService = ClassService();
  List<ClassModel>? classList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    classService.getClasses().then((classes) {
      setState(() {
        classList = classes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return classList == null
        ? Center(child: CircularProgressIndicator())
        : classList!.isEmpty
            ? Center(child: Text('No Classes Found'))
            : Column(
      children: List.generate(
        classList!.length,
        // (index) => ListTile(title: Text('It worked'),),
        (index) => ClassCard(
          clas: classList![index],
          showClassAvatar: widget.showClassAvatar,
          bodySeparationSize: widget.bodySeparationSize,
        ),
      ),
    );
  }
}
