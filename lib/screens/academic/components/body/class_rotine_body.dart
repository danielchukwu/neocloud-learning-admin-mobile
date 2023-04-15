import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/class_routine_list.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';

class ClassRoutineBody extends StatefulWidget {
  const ClassRoutineBody({Key? key}) : super(key: key);

  @override
  State<ClassRoutineBody> createState() => _ClassRoutineBodyState();
}

class _ClassRoutineBodyState extends State<ClassRoutineBody> {
  Map<String, String> filter = {};

  @override
  Widget build(BuildContext context) {
    print("filter: ${filter}");

    return Column(
      children: <Widget>[
        // Filter Section
        SizedBox(height: defaultSize * 3),
        FilterSection(press: updateFilter, showClass: true, showSection: true),

        // + Add button and List of CARDS
        SizedBox(height: defaultSize * 3),
        ClassRoutineList(data: classRoutineList),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      filter = filterData;
    });
  }
}