import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

// Widget - displays a list of users (superadmin, admin, educator or students)
class ListUsersScreen extends StatelessWidget {
  const ListUsersScreen({Key? key, required this.screenName}) : super(key: key);
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextExtraLarge(title: screenName),
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(

        ),
      ),
    );
  }
}
