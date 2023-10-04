// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/constants/constants.dart';
import 'package:neocloud_mobile/size_config.dart';

// @RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String screenName = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
          child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: SvgPicture.asset(
          nctFaviconBlue,
          width: 120,
          color: kBlueLight,
        ),
      )),
    );
  }
}
