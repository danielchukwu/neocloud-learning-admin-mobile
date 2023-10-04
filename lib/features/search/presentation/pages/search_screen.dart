import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/components/Lists/class_list.dart';
import 'package:neocloud_mobile/components/Lists/user_list.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/tile/user_tile.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/classes/remote_class_bloc.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_bloc.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_event.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_state.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/search_navbar/search_navbar_bloc.dart';
import 'package:neocloud_mobile/features/search/presentation/widget/search_navbar.dart';
import 'package:neocloud_mobile/size_config.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  static String screenName = "search";
  int usersPage = 1; // used for pagination
  int classesPage = 1;
  int itemsLimit = 10; // used to set the fetch limit on each query to the database

  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() => _onScroll(context));

    return Scaffold(
      body: BlocBuilder<RemoteUserBloc, RemoteUsersState>(
        builder: (context, userState) => SafeArea(
          child: BlocBuilder<RemoteClassBloc, RemoteClassesState>(
              builder: (context, classState) {
            return BlocBuilder<SearchNavbarBloc, SearchNavbarState>(
                builder: (context, navbarState) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search
                    const SizedBox(height: 20),
                    _buildSearchInput(
                      onChangePress: (value) => _onSearchInputChangePress(
                        context: context,
                        value: value,
                        users: userState.users,
                        classes: classState.classes,
                      ),
                    ),

                    // Navbar
                    const SearchScreenNavbar(),

                    // Result
                    const SizedBox(height: 10),
                    _buildSearchResult(
                        context, navbarState, userState, classState),
                  ],
                ),
              );
            });
          }),
        ),
      ),
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }

  void _onSearchInputChangePress({
    required BuildContext context,
    required String value,
    required List<UserEntity>? users,
    required List<ClassEntity>? classes,
  }) {
    // reset pages to 1
    usersPage = 1;
    classesPage = 1;

    BlocProvider.of<RemoteUserBloc>(context).add(
      GetUserEvent(
        text: value,
        existingUsers: users ?? [],
        page: 1,
      ),
    );
    BlocProvider.of<RemoteClassBloc>(context).add(
      GetClassesEvent(
        text: value,
        existingClasses: classes ?? [],
        page: 1,
      ),
    );
  }

  Widget _buildSearchResult(
    BuildContext context,
    SearchNavbarState navbarState,
    RemoteUsersState userState,
    RemoteClassesState classState,
  ) {
    return Padding(
      padding: _getResultPadding(navbarState),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // All users
          if (navbarState is SearchNavbarAllState) ...[
            _buildAllResult(userState),
            // loading More (show circular progress indicator)
            if (userState is RemoteUsersLoadingMoreState)
              _getCircularProgressIndicator(context),
          ],

          // Educators
          if (navbarState is SearchNavbarEducatorsState) ...[
            _buildEducatorsResult(userState),
            // loading More (show circular progress indicator)
            if (userState is RemoteUsersLoadingMoreState)
              _getCircularProgressIndicator(context),
          ],

          // Students
          if (navbarState is SearchNavbarStudentsState) ...[
            _buildStudentsResult(userState),
            // loading More (show circular progress indicator)
            if (userState is RemoteClassesLoadingMoreState)
              _getCircularProgressIndicator(context),
          ],

          // Classes
          if (navbarState is SearchNavbarClassesState) ...[
            _buildClassesResult(classState),
            // loading More (show circular progress indicator)
            if (classState is RemoteClassesLoadingMoreState)
              _getCircularProgressIndicator(context),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  _buildSearchInput({required Function(String v) onChangePress}) {
    return Padding(
      padding: screenPadding,
      child: AppsTextField(
    prefixIcon: Icons.search,
    hintText: "Search",
    controller: _controller,
    onSubmitPress: (_) {},
    onChangePress: onChangePress,
  ),
    );
  }

  _buildAllResult(RemoteUsersState userState) {
    if (userState is RemoteUsersDoneState ||
        userState is RemoteUsersLoadingMoreState) {
      return UserList(users: userState.users!);
    }

    return _buildUsersInitialOrLoadingResult(userState);
  }

  _buildEducatorsResult(RemoteUsersState userState) {
    if (userState is RemoteUsersDoneState ||
        userState is RemoteUsersLoadingMoreState) {
      return UserList(
        users: userState.users!
            .where((user) => (user.role != null &&
                user.role!.name.toLowerCase() == "educator"))
            .toList(),
      );
    }

    return _buildUsersInitialOrLoadingResult(userState);
  }

  _buildStudentsResult(RemoteUsersState userState) {
    if (userState is RemoteUsersDoneState ||
        userState is RemoteUsersLoadingMoreState) {
      return UserList(
        users: userState.users!
            .where((user) => (user.role != null &&
                user.role!.name.toLowerCase() == 'student'))
            .toList(),
      );
    }

    return _buildUsersInitialOrLoadingResult(userState);
  }

  _buildClassesResult(RemoteClassesState classState) {
    return Builder(
      builder: (context) {
        if (classState is RemoteClassesInitialState) {
          return const SizedBox();
        }

        // loading
        if (classState is RemoteClassesLoadingState) {
          return Column(
            children: List.generate(3, (index) => const ClassCardSkeleton()),
          );
        }
        // Done
        if (classState is RemoteClassesDoneState ||
            classState is RemoteClassesLoadingMoreState) {
          return ClassList(
              classList: classState.classes!, showClassAvatar: true);
        }

        return const SizedBox();
      },
    );
  }

  EdgeInsets _getResultPadding(SearchNavbarState navbarState) {
    // don't add a padding for class results
    if (navbarState is! SearchNavbarClassesState) {
      return const EdgeInsets.fromLTRB(20, 0, 20, 20);
    } else {
      return const EdgeInsets.all(0);
    }
  }

  _buildUsersInitialOrLoadingResult(RemoteUsersState userState) {
    // Initial
    if (userState is RemoteUsersInitialState) {
      return const SizedBox();
    }
    // Loading (show skeleton)
    if (userState is RemoteUsersLoadingState) {
      return Column(
        children: List.generate(
          7,
          (index) => const Padding(
            padding: EdgeInsets.only(bottom: 19),
            child: UserTileSkeleton(),
          ),
        ),
      );
    }

    // Empty
    return const SizedBox();
  }

  _getCircularProgressIndicator(BuildContext context) {
    var platform = Theme.of(SizeConfig.appContext!).platform;

    if (platform == TargetPlatform.iOS) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(child: CupertinoActivityIndicator()),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Theme.of(context).canvasColor.withOpacity(.4),
            ),
          ),
        ),
      );
    }
  }

  void _onScroll(BuildContext context) {
    var _navbarBloc = BlocProvider.of<SearchNavbarBloc>(context);

    // fetch more classes (when user scrolls to the bottom of the screen)
    if (_navbarBloc.state is SearchNavbarClassesState) {
      _handleFetchMoreClasses(context);
      // fetch more users (when user scrolls to the bottom of the screen)
    } else {
      _handleFetchMoreUsers(context);
    }
  }

  void _handleFetchMoreClasses(BuildContext context) {
    var _classesBloc = BlocProvider.of<RemoteClassBloc>(context);

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // ensure the number of the next page to be fetched is correct
      var nextPageNumber =
          (_classesBloc.state.classes!.length ~/ itemsLimit) + 1;
      if (nextPageNumber == classesPage) return;
      classesPage = nextPageNumber;

      // fetch
      BlocProvider.of<RemoteClassBloc>(context).add(
        GetClassesEvent(
          text: _controller.text,
          existingClasses: _classesBloc.state.classes ?? [],
          page: classesPage,
        ),
      );
    }
  }

  void _handleFetchMoreUsers(BuildContext context) {
    var _usersBloc = BlocProvider.of<RemoteUserBloc>(context);

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // ensure the number of the next page to be fetched is correct
      var nextPageNumber = (_usersBloc.state.users!.length ~/ itemsLimit) + 1;
      if (nextPageNumber == usersPage) return;
      usersPage = nextPageNumber;

      // fetch
      BlocProvider.of<RemoteUserBloc>(context).add(
        GetUserEvent(
          text: _controller.text,
          existingUsers: _usersBloc.state.users ?? [],
          page: usersPage,
        ),
      );
    }
  }
}
