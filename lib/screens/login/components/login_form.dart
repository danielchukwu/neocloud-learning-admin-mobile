import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key})
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  late String email;
  late String password;

  Future<void> submitForm() async {
    // Make API POST request to authenticate student user
    // ...
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Email
          LoginInputField(
            labelText: 'Email',
            press: (value) {
              setState(() {
                email = value!;
              });
            },
          ),
          // Password
          LoginInputField(
            labelText: 'Password',
            obsureText: true,
            press: (value) {
              setState(() {
                password = value!;
              });
            },
          ),

          // Button - used for submitting form
          SizedBox(height: defaultSize * 4),
          AppsButton(
              title: 'Login',
              bgColor: kBlueLight,
              borderRadius: defaultSize * 2,
              press: (context) {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  debugPrint("Email: $email\nPassword: $password");
                  // Submit form data
                  submitForm();
                }
              }),
          SizedBox(height: defaultSize * 2),
        ],
      ),
    );
  }
}