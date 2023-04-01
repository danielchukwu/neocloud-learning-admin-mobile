import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/login/components/appbar_back_button.dart';
import 'package:neocloud_mobile/screens/login/components/intro_text.dart';
import 'package:neocloud_mobile/screens/login/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
        child: Column(
          children: <Widget>[
            // Section 1 - Intro Text
            const Spacer(flex: 3,),
            const IntroText(),

            // Section 2 - Form
            const Spacer(flex: 1),
            LoginForm(),

            const Spacer(flex: 8,),
          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(defaultSize * 5.8),
      child: const AppBarBackButton(),
    );
  }
}