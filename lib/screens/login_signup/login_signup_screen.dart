import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/login_signup/components/appbar_leading_icon.dart';
import 'package:neocloud_mobile/screens/login_signup/components/intro_text.dart';
import 'package:neocloud_mobile/screens/login_signup/components/login_form.dart';
import 'package:neocloud_mobile/screens/login_signup/components/signup_form.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});
  static String screenName = 'Login';

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool showLogin = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          padding: screenPadding,
          child: Container(
            // color: Colors.red,
            constraints: BoxConstraints(maxHeight: screenHeight / 1.12),
            child: Column(
              children: <Widget>[
                // Section 1 - Intro Text'
                Spacer(),
                const IntroText(),

                // Section 2 - Form
                SizedBox(height: defaultSize),
                showLogin ? LoginForm() : SignupForm(),

                // Section 3 - switch forms
                Spacer(),
                Center(
                  child: TextMedium(
                      title: showLogin
                          ? "Don't have an account?"
                          : "Already have an account?",
                      color: kBlack.withOpacity(.4)),
                ),
                SizedBox(height: defaultSize * 1.5),
                // AppsButton(title: showLogin ? 'Sign up' : 'Login', press: (context) => setState(() => showLogin = !showLogin) ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton(
                        onPressed: () => setState(() => showLogin = !showLogin),
                        child: TextMedium(title: showLogin ? 'Sign up' : 'Login'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: defaultSize * 1.2),
                          ),
                        ),
                      )
                    ]),

                SizedBox(height: defaultSize * 2),
              ],
            ),
          ),
        ));
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(defaultSize * 5.8),
      child: AppBar(leading: const LoginAppBarBackButton()),
    );
  }
}
