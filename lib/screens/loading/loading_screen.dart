import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: defaultSize! * 20,
            margin: EdgeInsets.only(bottom: defaultSize * 0.3),
            child: Image(
              image: AssetImage('assets/images/logo-dark.png'),
            ),
          )
        ),
      ),
    );
  }
}
