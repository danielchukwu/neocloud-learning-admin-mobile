import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassWorkBody extends StatefulWidget {
  const ClassWorkBody({Key? key}) : super(key: key);

  @override
  State<ClassWorkBody> createState() => _ClassWorkBodyState();
}

class _ClassWorkBodyState extends State<ClassWorkBody> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: "");

    _searchController.addListener(() {
      // Filter and fetch data if necessary
      print(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: screenPadding,
        child: Column(
          children: [
            // ClassWork List
            SizedBox(height: defaultSize * 2),
            // ClassWorkList(data: classWorksList),
            // Search Text Field
            buildSearchTextField(press: updateSearchController),

            // + Add Button
            SizedBox(height: defaultSize * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildAddButton(title: "Add Class Work", press: (context) {}),
              ],
            ),

            // Cards
            SizedBox(height: defaultSize),
            Column(
              children: List.generate(classWorksList.length,
                      (index) => ClassWorkCard(data: classWorksList[index])),
            ),

            // Bottom Padding
            pageBottomPadding(),
          ],
        ),
      ),
    );
  }

  updateSearchController(String value) {
    setState(() {
      _searchController.text = value;
    });
  }
}
