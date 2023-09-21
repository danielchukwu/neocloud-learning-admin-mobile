// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/graphql/services/auth_service.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final _formkey = GlobalKey<FormState>();
  final authService = AuthService();
  bool btnIsLoading = false;
  late String _name;
  late String _phone;
  late String _email;
  late String _password;

  Future<void> signup() async {
    setState(() { btnIsLoading = true; });
    UserModel? user = await authService.signup(context,
        email: _email, password: _password, name: _name, phone: _phone);
    setState(() { btnIsLoading = false; });

    debugPrint("Logged In User: ${user?.name}");
    if (user != null && user.name.isNotEmpty) {
      Provider.of<UserProvider>(context, listen: false).setUser(user);
      showTopAlertDialog(text: 'Account Created. Logging In 👍', isError: false);
      Future.delayed(const Duration(seconds: 2), () => navigateToHome() );
    }
  }

  void navigateToHome() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          // Name
          const SizedBox(height: 20),
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
          // Phone
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
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

          // Button - used for submitting form
          const SizedBox(height: 40),
          AppsButton(
              title: 'Sign up',
              bgColor: kBlueLight,
              bgColorLoading: kBlueLight.withOpacity(.5),
              isLoading: btnIsLoading,
              press: (context) {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  signup();
                }
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
