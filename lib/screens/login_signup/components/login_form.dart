// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/graphql/services/auth_service.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final authService = AuthService();
  bool btnIsLoading = false;
  late String _email;
  late String _password;

  Future<void> login(BuildContext context) async {
    setState(() {
      btnIsLoading = true;
    });
    UserModel? user =
        await authService.login(email: _email, password: _password);
    setState(() {
      btnIsLoading = false;
    });

    debugPrint("Logged In User: ${user?.name}");
    if (user != null && user.name.isNotEmpty) {
      Provider.of<UserProvider>(context, listen: false).setUser(user);
      showTopAlertDialog(text: 'Login was Successful! 👍', isError: false);
      Future.delayed(const Duration(seconds: 2), () => navigateToHome());
    }
  }

  void navigateToHome() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ));
    String dashboardLink = DashboardScreen.screenName.toLowerCase();
    print(dashboardLink);
    Navigator.pushNamed(context, '/$dashboardLink');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          // Email
          const SizedBox(height: 20),
          LoginInputField(
            labelText: 'Email',
            validate: validateEmail,
            press: (value) {
              setState(() {
                _email = value!;
              });
            },
          ),

          // Password
          const SizedBox(height: 20),
          LoginInputField(
            labelText: 'Password',
            obsureText: true,
            validate: validateRequireField,
            press: (value) {
              setState(() {
                _password = value!;
              });
            },
          ),

          // forgot password
          const SizedBox(height: 20),
          buildForgotPasswordLink(),

          // Button - used for submitting form
          const SizedBox(height: 40),
          AppsButton(
              title: 'Login',
              bgColor: kBlueLight,
              bgColorLoading: kBlueLight.withOpacity(.5),
              borderRadius: 10,
              isLoading: btnIsLoading,
              minButtonHeight: 45,
              press: (context) {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  login(context);
                }
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Row buildForgotPasswordLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextLink(
            title: 'Forgot Password?',
            weight: FontWeight.w500,
            press: (context) => debugPrint('forgot password clicked!'))
        // TextMedium(title: 'Forgot Password?', weight: FontWeight.w500,)
      ],
    );
  }
}
