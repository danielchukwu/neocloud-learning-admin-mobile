import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/graphql/services/user_service.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';

import '../widgets.dart';

class UserList extends StatefulWidget {
  const UserList({
    super.key,
    this.usersList,
    this.spinnerScreeMaxHeight
  });

  final List<UserModel>? usersList;
  final double? spinnerScreeMaxHeight;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var userService = UserService();
  List<UserModel>? dataList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (!mounted) return; 

    if (widget.usersList == null) {
      userService.getUsers().then((users) {
      setState(() { dataList = users; });
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.usersList != null) { dataList = widget.usersList; }
    
    return dataList == null
        ? spinnerScreen(screenMaxHeight: widget.spinnerScreeMaxHeight)
        : dataList!.isEmpty
            ? nothingWasFoundScreen(screenMaxHeight: widget.spinnerScreeMaxHeight)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  dataList!.length,
                  (index) => GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: dataList![index]),)),
                    child: UserTile(
                      user: dataList![index]
                    ),
                  ),
                ),
              );
  }

  toList() {}
}
