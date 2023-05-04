import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/course_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/class_works/components/class_works_body.dart';
import 'package:neocloud_mobile/screens/search/components/search_field.dart';
import 'package:neocloud_mobile/screens/search/components/search_filter.dart';
import 'package:neocloud_mobile/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });
  static String screenName = "Search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController(text: "");
  List<String> searchFilter = ["All", "Educators", "Students", "Courses"];
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      print("Search Now...");
      print(_searchController.text);
    });
  }

  void _updateSearchController(String value) {
    setState(() {
      _searchController.text = value;
    });
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              SizedBox(height: defaultSize * 2),
              SearchHeader(updateSearch: _updateSearchController),

              // Filter
              SearchFilter(searchFilter: searchFilter, selectedIndex: _selectedIndex, updateIndex: updateIndex),

              // Result
              SizedBox(height: defaultSize),
              Padding(
                padding: EdgeInsets.fromLTRB(defaultSize * 2, 0, defaultSize * 2, defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Users List
                  UserList(usersList: users.where((user) => (_selectedIndex == 0)).toList()),
                  UserList(usersList: users.where((user) => (user.role == "Educator" && _selectedIndex == 1)).toList()),
                  UserList(usersList: users.where((user) => (user.role == "Student" && _selectedIndex == 2)).toList()),

                  // Courses List
                  _selectedIndex == 3 ? CoursesList(coursesList: coursesList) : SizedBox(),
              
                  SizedBox(height: defaultSize * 3),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


