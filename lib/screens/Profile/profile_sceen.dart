import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  final String screenName = 'Profile';

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
