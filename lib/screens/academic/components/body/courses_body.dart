import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';

class CoursesBody extends StatefulWidget {
  const CoursesBody({Key? key}) : super(key: key);

  @override
  State<CoursesBody> createState() => _CoursesBodyState();
}

class _CoursesBodyState extends State<CoursesBody> {
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
          showClass: true,
        ),

        // + Create Routing and List of CARDS
        SizedBox(height: defaultSize * 3),
        // AttendanceList(data: attendanceList),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      filter = filterData;
    });
  }
}