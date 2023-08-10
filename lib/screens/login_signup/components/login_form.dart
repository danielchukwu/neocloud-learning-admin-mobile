// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/services/auth_service.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/utils/validation.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final authService = AuthService();
  late String _email;
  late String _password;

  Future<void> login() async {
    String? token = await authService.login(email: _email, password: _password);
    AppSecureStorage.getToken().then((value) => {
      print("${token} == ${value}"),
      if (token == value) {
        navigateToHome()
      } else {
        resetForm()
      }
    });
  }

  void navigateToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
  }

  void resetForm() {
    setState(() {
      _email = "";
      _password = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          // Email
          SizedBox(height: defaultSize * 2),
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
          SizedBox(height: defaultSize * 2),
          LoginInputField(
            labelText: 'Password',
            obsureText: true,
            validate: validatePassword,
            press: (value) {
              setState(() {
                _password = value!;
              });
            },
          ),

          // forgot password
          SizedBox(height: defaultSize * 2),
          buildForgotPasswordLink(),

          // Button - used for submitting form
          SizedBox(height: defaultSize * 4),
          AppsButton(
              title: 'Login',
              bgColor: kBlueLight,
              borderRadius: defaultSize,
              press: (context) {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  login();
                }
              }),
          SizedBox(height: defaultSize * 2),
        ],
      ),
    );
  }

  Row buildForgotPasswordLink() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextLink(title: 'Forgot Password?', weight: FontWeight.w500, press: (context) => debugPrint('forgot password clicked!'))
            // TextMedium(title: 'Forgot Password?', weight: FontWeight.w500,)
          ],
        );
  }
}
