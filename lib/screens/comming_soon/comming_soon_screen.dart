import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  final String lottieFile = 'assets/lottiefiles/132660-basketball.json';
  static String screenName = 'Coming Soon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
          child: Column(
            children: <Widget>[
              Lottie.asset(lottieFile, width: defaultSize * 20),
              SizedBox(height: defaultSize * 5),
              TextCustom(
                title: 'Coming Soon',
                fontSize: defaultSize * 2.5,
                weight: FontWeight.w600,
                color: kBlue,
              ),
              SizedBox(height: defaultSize * 3),
              Container(
                child: WelcomeButton(title: 'Go Back', press: Navigator.pop),
              )
            ],
          ),
        ),
      ),
    );
  }
}
