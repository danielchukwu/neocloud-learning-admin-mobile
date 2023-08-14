import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/Lists/class_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/graphql/services/search_service.dart';
import 'package:neocloud_mobile/screens/search/components/search_filter.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });
  static String screenName = "Search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchService = SearchService();
  List<UserModel>? usersList;
  List<ClassModel>? classesList;

  List<String> searchFilter = [
    "All",
    "Educators",
    "Students",
    "Classes",
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void search(String value) {
    print('search');
    loadData(value);
  }

  void loadData(String value) {
    searchService.getUsersClasses(name: value).then((data) {
      print(mounted);
      if (mounted) {
        setState(() {
          print('SET STATE');
          usersList = data['users'] as List<UserModel>;
          classesList = data['classes'] as List<ClassModel>;
      });
      }
    });
  }

  void updateIndex(int index) { setState(() { _selectedIndex = index; }); }

  @override
  Widget build(BuildContext context) {
    print('REBUILD UI');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              SizedBox(height: defaultSize * 2),

              // SearchHeader(updateSearch: search),
              Padding(
                padding: screenPadding,
                child: buildSearchTextField(press: (String v){}, onChangePress: loadData),
              ),

              // Filter
              SearchFilter(
                searchFilter: searchFilter,
                selectedIndex: _selectedIndex,
                updateIndex: updateIndex,
              ),

              // Result
              SizedBox(height: defaultSize),
              Padding(
                padding: _selectedIndex != 3
                    ? EdgeInsets.fromLTRB(defaultSize * 2, 0, defaultSize * 2, defaultSize * 2)
                    : EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Users List
                    _selectedIndex == 0 && usersList != null ? 
                      UserList(usersList: usersList!.where((user) => (user.role!.name.toLowerCase() == "educator" || user.role!.name.toLowerCase() == 'student') ).toList())
                    : SizedBox(),
                    
                    _selectedIndex == 1 && usersList != null ? 
                    UserList(usersList: usersList!.where((user) => (user.role!.name.toLowerCase() == "educator") ).toList()) : SizedBox(),

                    _selectedIndex == 2 && usersList != null ? 
                    UserList(usersList: usersList!.where((user) => (user.role!.name.toLowerCase() == 'student') ).toList() ) : SizedBox(),

                    _selectedIndex == 3 ? 
                    ClassList( classList: classesList!, showClassAvatar: true ) : SizedBox(),

                    SizedBox(height: defaultSize * 3),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
