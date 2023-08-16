// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/login_signup/login_signup_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

// @RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String screenName = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxHeight: SizeConfig.screenHeight ?? 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
            
                  // Logo - neocloud logo icon
                  Spacer(flex: 2),
                  SvgPicture.asset(nctBannerBlueBlack, width: defaultSize * 25, color: kBlueLight),
            
                  // Button - takes us to the login page
                  Spacer(flex: 2,),
                  WelcomeButton(
                    title: 'Login',
                    press: () => Navigator.pushNamed(context, '/' + LoginSignupScreen.screenName),
                    iconIsLeading: false,
                  ),
            
                  // Link - access courses
                  SizedBox(height: defaultSize * 5),
                  TextLink(
                      title: 'Access Virtual Course',
                      color: kBlack70,
                      press: (_) => Navigator.pushNamed(context, '/' + ComingSoonScreen.screenName)
                      ),
            
                  // Link - certificate validation
                  Spacer(flex: 1),
                  TextLink(
                    title: 'Certificate Validation',
                    color: kBlack70,
                    press: (_) => Navigator.pushNamed(context, '/' + ComingSoonScreen.screenName)
                  ),
                  SizedBox(height: defaultSize * 5,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
