import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/class_schedule_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';

class ClassSchedulesBody extends StatefulWidget {
  const ClassSchedulesBody({Key? key}) : super(key: key);

  @override
  State<ClassSchedulesBody> createState() => _ClassSchedulesBodyState();
}

class _ClassSchedulesBodyState extends State<ClassSchedulesBody> {
  Map<String, String> _filter = {};

  @override
  Widget build(BuildContext context) {
    print("filter: $_filter");

    return Column(
      children: <Widget>[
        // Filter Section
        SizedBox(height: defaultSize * 3),
        FilterSection(press: updateFilter, showClass: true, showSection: true),

        // + Add button
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Create Routing", press: (context) {}),
          ],
        ),

        // List of CARDS
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(classScheduleList.length, (index) => ClassScheduleCard(data: classScheduleList[index])),
        ),

        // + Add button and List of CARDS
        // SizedBox(height: defaultSize * 3),
        // ClassRoutineList(data: classRoutineList),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      _filter = filterData;
    });
  }
}