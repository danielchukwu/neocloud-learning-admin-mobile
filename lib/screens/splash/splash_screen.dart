// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';
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
        margin: EdgeInsets.only(bottom: defaultSize * 5),
        child: SvgPicture.asset(nctFaviconBlue, width: defaultSize * 12, color: kBlueLight,),
      )),
    );
  }
}
