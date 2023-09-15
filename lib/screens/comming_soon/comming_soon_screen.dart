// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

// @RoutePage()
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  final String lottieFile = 'assets/lottiefiles/132660-basketball.json';
  static String screenName = 'comingsoon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Lottie.asset(lottieFile, width: 200),
              const SizedBox(height: 50),
              TextCustom(
                title: 'Coming Soon',
                fontSize: 25,
                weight: FontWeight.w600,
                color: kBlue,
              ),
              const SizedBox(height: 30),
              WelcomeButton(title: 'Go Back', press: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
