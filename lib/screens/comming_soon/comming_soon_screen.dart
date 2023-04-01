import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);
  final String _lottie_1 =
      'https://assets7.lottiefiles.com/packages/lf20_nqztfA5gKq.json';
  final String _lottie2 =
      'https://assets8.lottiefiles.com/packages/lf20_1mA0i9a3PH.json';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
          child: Column(
            children: <Widget>[
              Lottie.network(_lottie_1, width: defaultSize * 20),
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
