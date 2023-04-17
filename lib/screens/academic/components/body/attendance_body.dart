import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/attendance_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';

class AttendanceBody extends StatefulWidget {
  const AttendanceBody({Key? key}) : super(key: key);

  @override
  State<AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<AttendanceBody> {
  Map<String, String> filter = {};

  @override
  Widget build(BuildContext context) {
    print("filter: ${filter}");

    return Column(
      children: <Widget>[
        // Filter Section
        SizedBox(height: defaultSize * 3),
        FilterSection(
          press: updateFilter,
          showMonthYear: true,
          showClass: true,
          showSection: true,
        ),

        // + Take Attendance Button
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Take Attendance", press: (context) {}),
          ],
        ),

        // + Take Attendance and List of CARDS
        Column(
          children: List.generate(attendanceList.length, (index) => AttendanceCard(data: attendanceList[index])),
        ),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      filter = filterData;
    });
  }
}
