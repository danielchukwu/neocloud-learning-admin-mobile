import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/graphql/services/user_service.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';

class UserList extends StatefulWidget {
  const UserList({
    super.key,
    this.usersList,
  });

  final List<UserModel>? usersList;

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
        ? Center(child: CircularProgressIndicator())
        : dataList!.isEmpty
            ? Center(child: Text('No Classes Found'))
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
