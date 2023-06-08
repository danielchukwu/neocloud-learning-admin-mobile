import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';

import '../../academic/academic_screen.dart';

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

  updateSearchController(String value) {
    setState(() {
      _searchController.text = value;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      buildSliverAppBar(
        title: AcademicScreen.screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: false,
        routeWidget1: ProfileScreen(user: users[0]),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Text Field
              SizedBox(height: defaultSize * 2),
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
                    (index) => ClassWorkCard(clas: classWorksList[index])),
              ),

              // Bottom Padding
              pageBottomPadding(),
            ],
          ),
        ),
      ),
    ]);
  }
}
