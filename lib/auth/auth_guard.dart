import 'package:flutter/material.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/login_signup/login_signup_screen.dart';
import 'package:neocloud_mobile/screens/splash/splash_screen.dart';
import 'package:neocloud_mobile/screens/welcome/welcome_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

class AuthGuardObserver extends NavigatorObserver {  
  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
    print('POP 🍿');
  }
  
  @override
  Future<void> didPush(Route route, Route? previousRoute) async {
    debugPrint('PUSH ➕');
    bool isLoggedIn = await AppSecureStorage.tokenExists();
    String? routeName = route.settings.name?.substring(1,);  // e.g '/home' -> 'home'
    List<String> openRoutes = [WelcomeScreen.screenName, LoginSignupScreen.screenName, SplashScreen.screenName, ComingSoonScreen.screenName];
    debugPrint('Authenticated Status: $isLoggedIn');
    debugPrint('routeName: ${route.settings.name}');
    debugPrint('routeName: $routeName');
    debugPrint('openRoutes: $openRoutes');

    if (!isLoggedIn && !openRoutes.contains(routeName)) {
      debugPrint('Redirecting 💫');
      Navigator.pushNamed(SizeConfig.appContext!, '/auth');
    }
  }
  
  @override
  void didRemove(Route route, Route? previousRoute) {
    // TODO: implement didRemove
    print('REMOVE 🗑️');
  }
}