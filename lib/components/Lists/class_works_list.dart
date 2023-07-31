import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/graphql/services/classwork_service.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

class ClassworksList extends StatefulWidget {
  const ClassworksList(
      {Key? key, this.showFeedback = false})
      : super(key: key);

  final bool showFeedback;
  @override
  State<ClassworksList> createState() => _ClassworksListState();
}

class _ClassworksListState extends State<ClassworksList> {
  var classworkService = ClassworkService();
  List<ClassworkModel>? classworkList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    classworkService.getClassworks().then((classes) {
      setState(() {
        classworkList = classes;
        print('classworkList');
        print(classworkList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return classworkList == null
        ? Center(child: CircularProgressIndicator())
        : classworkList!.isEmpty
            ? Center(child: Text('No Classes Found'))
            : Column(
      children: List.generate(
        classworkList!.length,
        (index) => ClassWorkCard(
          classwork: classworkList![index],
          enableGestureDecorator: true,
          showFeedback: false,
        ),
      ),
    );
  }
}
