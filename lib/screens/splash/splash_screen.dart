import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final String iconAsset = 'assets/images/logo-light-sm.png';
  static String screenName = 'Loading';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
          child: Container(
        margin: EdgeInsets.only(bottom: defaultSize * 5),
        child: DisplayAssetImage(icon: iconAsset, size: defaultSize * 4),
      )),
    );
  }
}
