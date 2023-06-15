import 'package:flutter/material.dart';
import 'package:neocloud_mobile/controllers/NavItem.dart';
import 'package:neocloud_mobile/screens/academic/academic_screen.dart';
import 'package:neocloud_mobile/screens/cart/cart_screen.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';
import 'package:neocloud_mobile/screens/search/search_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/system_logos_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/language_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/manage_account_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/payment_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/system_general_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/smtp_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/system_screen.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/screens/splash/splash_screen.dart';
import 'package:neocloud_mobile/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavItems()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neo Cloud Technologies',
      theme: buildTheme(),
      initialRoute: '/welcome',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/coming-soon': (context) => const ComingSoonScreen(),
        '/academic': (context) => const AcademicScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        // Removed because the ProfileScreen widget takes arguments
        // '/profile': (context) => ProfileScreen(),
        '/search': (context) => const SearchScreen(),
        '/cart': (context) => const CartScreen(),
        // Removed because the CourseScreen widget takes arguments
        // '/course': (context) => const CourseScreen(),

        // Settings
        '/settings': (context) => const SettingsScreen(),
        '/manage-account': (context) => const ManageAccountScreen(),
        '/system': (context) => const SystemScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/language': (context) => const LanguageScreen(),
        '/smtp': (context) => SmtpScreen(),
        '/general': (context) => SystemGeneralScreen(),
        '/system-logos': (context) => SystemLogosScreen(),
      },
    );
  }

  ThemeData buildTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 16),
        ),
        scaffoldBackgroundColor: Colors.white,
        splashFactory: InkRipple.splashFactory
        );
  }
}
