import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/screens/Profile/screens/general_profile.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, this.user}) : super(key: key);
  static String screenName = "profile";

  UserModel? user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    widget.user ??= context.watch<UserProvider>().user;
    UserModel user = widget.user!;

    switch (widget.user?.role?.name) {
      case 'student':
        return GeneralProfile(user: user,);
      default:
        return GeneralProfile(user: user,);
    }
    
  }
}
