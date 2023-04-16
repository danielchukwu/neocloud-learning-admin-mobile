import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/list/courses_list.dart';
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

        // + Add button and List of CARDS
        SizedBox(height: defaultSize * 3),
        CoursesList(data: coursesList),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      filter = filterData;
    });
  }
}