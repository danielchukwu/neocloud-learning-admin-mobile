import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/components/courses_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
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

        // + Add Course Button
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Course", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(coursesList.length, (index) => CoursesCard(data: coursesList[index])),
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