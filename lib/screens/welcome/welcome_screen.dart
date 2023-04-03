// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                // Logo - neocloud logo icon
                SizedBox(height: defaultSize * 20),
                DisplayAssetImage(icon: neocloudLogo, size: defaultSize * 25),

                // Button - takes us to the login page
                SizedBox(height: defaultSize * 25),
                WelcomeButton(
                  title: 'Student Login',
                  press: navigateToLogin,
                  iconIsLeading: false,
                ),

                // Link - access courses
                SizedBox(height: defaultSize * 5),
                TextLink(
                    title: 'Access Virtual Course',
                    press: (context) => navigateToComingSoon(context: context)),

                // Link - certificate validation
                SizedBox(height: defaultSize),
                TextLink(
                  title: 'Certificate Validation',
                  press: (context) => navigateToComingSoon(context: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
