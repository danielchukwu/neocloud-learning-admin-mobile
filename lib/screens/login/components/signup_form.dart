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

class SignupForm extends StatefulWidget {
  SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final _formkey = GlobalKey<FormState>();
  final authService = AuthService();
  late String _name;
  late String _phone;
  late String _email;
  late String _password;

  Future<void> signup() async {
    String? token = await authService.signup(email: _email, password: _password, name: _name, phone: _phone);
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
      _name = "";
      _phone = "";
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
          // Name
          SizedBox(height: defaultSize * 2),
          LoginInputField(
            labelText: 'Name',
            validate: validateRequireField,
            press: (value) {
              setState(() {
                _name = value!;
              });
            },
          ),
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
          // Phone
          SizedBox(height: defaultSize * 2),
          LoginInputField(
            labelText: 'Phone Number',
            validate: validatePhoneNumber,
            press: (value) {
              setState(() {
                _phone = value!;
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
              title: 'Sign up',
              bgColor: kBlueLight,
              press: (context) {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  signup();
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
