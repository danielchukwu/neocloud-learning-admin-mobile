import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/login/components/appbar_leading_icon.dart';
import 'package:neocloud_mobile/screens/login/components/intro_text.dart';
import 'package:neocloud_mobile/screens/login/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String screenName = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Section 1 - Intro Text
            SizedBox(height: defaultSize * 10),
            const IntroText(),

            // Section 2 - Form
            SizedBox(height: defaultSize),
            LoginForm(),

            SizedBox(height: defaultSize * 10,)
          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(defaultSize * 5.8),
      child: AppBar(leading: const LoginAppBarBackButton()),
    );
  }
}