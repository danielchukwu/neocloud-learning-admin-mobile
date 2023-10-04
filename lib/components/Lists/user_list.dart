import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/tile/user_tile.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';
import '../widgets.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, this.users, this.spinnerScreeMaxHeight});

  final List<UserEntity>? users;
  final double? spinnerScreeMaxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        users!.length,
        (index) => GestureDetector(
          // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: dataList![index]),)),
          child: UserTile(user: users![index]),
        ),
      ),
    );
  }
}
