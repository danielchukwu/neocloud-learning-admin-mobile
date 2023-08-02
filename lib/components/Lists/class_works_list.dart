import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/graphql/services/classwork_service.dart';

class ClassworksList extends StatefulWidget {
  const ClassworksList(
      {Key? key, this.classworkList, this.showFeedback = false})
      : super(key: key);

  final List<ClassworkModel>? classworkList;
  final bool showFeedback;
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
    
    if (widget.classworkList == null){
      classworkService.getClassworks().then((classes) {
        setState(() { dataList = classes; });
      });
    } else {
      dataList = widget.classworkList;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return dataList == null
        ? Center(child: CircularProgressIndicator())
        : dataList!.isEmpty
            ? Center(child: Text('No Classes Found'))
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
