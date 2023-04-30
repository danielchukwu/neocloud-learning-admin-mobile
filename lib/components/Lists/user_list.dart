import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/tile/user_tile.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/search/search_screen.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.usersList,
  });

  final List<Account> usersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        usersList.length,
        (index) => GestureDetector(
          onTap: () => navigateToScreen(
              context: context, routeName: '/profile'),
          child: UserTile(
            avatar: usersList[index].avatar,
            title: usersList[index].fullName,
            subtitle: usersList[index].role,
          ),
        ),
      ),
    );
  }
}