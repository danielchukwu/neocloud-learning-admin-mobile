// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/components/Lists/class_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_bloc.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_event.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_state.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/graphql/services/search_service.dart';
// import 'package:neocloud_mobile/features/search/presentation/widget/search_filter.dart';
import 'package:neocloud_mobile/features/search/presentation/pages/search_screen.dart';
import 'package:neocloud_mobile/features/search/presentation/widget/search_filter.dart';

class SearchNavbar {
  static final items = ["All", "Educators", "Students", "Classes"];
  static int selectedItems = 0;
}

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  static String screenName = "search";

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

  void loadData(String value) {
    // searchService.getUsersClasses(name: value).then((data) {
    //   print(mounted);
    //   if (mounted) {
    //     setState(() {
    //       print('SET STATE');
    //       usersList = data['users'] as List<UserModel>;
    //       classesList = data['classes'] as List<ClassModel>;
    //     });
    //   }
    // });
  }

  void updateIndex(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemoteUserBloc, RemoteUserState>(
        builder: (context, state) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search
                const SizedBox(height: 20),

                Padding(
                  padding: screenPadding,
                  child: buildSearchTextField(
                    press: (String v) {},
                    onChangePress: (value) {
                      debugPrint('*');
                      BlocProvider.of<RemoteUserBloc>(context).add(GetUserEvent(value));
                    },
                  ),
                ),

                // Filter
                SearchFilter(
                  searchFilter: searchFilter,
                  selectedIndex: _selectedIndex,
                  updateIndex: updateIndex,
                ),

                // Result
                const SizedBox(height: 10),
                Padding(
                  padding: _selectedIndex != 3
                      ? const EdgeInsets.fromLTRB(20, 0, 20, 20)
                      : const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Users List
                      _selectedIndex == 0 && usersList != null
                          ? UserList(
                              usersList: usersList!
                                  .where((user) =>
                                      (user.role!.name.toLowerCase() ==
                                              "educator" ||
                                          user.role!.name.toLowerCase() ==
                                              'student'))
                                  .toList())
                          : const SizedBox(),

                      _selectedIndex == 1 && usersList != null
                          ? UserList(
                              usersList: usersList!
                                  .where((user) =>
                                      (user.role!.name.toLowerCase() ==
                                          "educator"))
                                  .toList())
                          : const SizedBox(),

                      _selectedIndex == 2 && usersList != null
                          ? UserList(
                              usersList: usersList!
                                  .where((user) =>
                                      (user.role!.name.toLowerCase() ==
                                          'student'))
                                  .toList())
                          : const SizedBox(),

                      _selectedIndex == 3
                          ? ClassList(
                              classList: classesList!, showClassAvatar: true)
                          : const SizedBox(),

                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}
