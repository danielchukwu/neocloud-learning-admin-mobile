import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';
import 'package:neocloud_mobile/screens/academic/components/syllabus_list.dart';

class SyllabusBody extends StatefulWidget {
  const SyllabusBody({Key? key}) : super(key: key);

  @override
  State<SyllabusBody> createState() => _SyllabusBodyState();
}

class _SyllabusBodyState extends State<SyllabusBody> {
  Map<String, String> filter = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Filter section
        SizedBox(height: defaultSize * 3),
        FilterSection(
          press: updateFilter,
          showClass: true,
          showSection: true,
        ),

        // + Add Syllabus and List of CARDS
        SizedBox(height: defaultSize * 3),
        SyllabusList(data: syllabiList),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      filter = filterData;
    });
  }
}