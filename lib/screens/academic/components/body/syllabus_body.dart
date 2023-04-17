import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/syllabus_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';

class SyllabusBody extends StatefulWidget {
  const SyllabusBody({Key? key}) : super(key: key);

  @override
  State<SyllabusBody> createState() => _SyllabusBodyState();
}

class _SyllabusBodyState extends State<SyllabusBody> {
  Map<String, String> _filter = {};

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

        // + Add Syllabus Button
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Syllabus", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(syllabiList.length, (index) => SyllabusCard(data: syllabiList[index])),
        ),
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      _filter = filterData;
    });
  }
}