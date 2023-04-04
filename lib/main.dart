import 'package:flutter/material.dart';
import 'package:neocloud_mobile/controllers/NavItem.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/academic_screen.dart';
import 'package:neocloud_mobile/screens/back_office/back_office_screen.dart';
import 'package:neocloud_mobile/screens/class_works/class_works_screen.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/screens/finance/finance_screen.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';
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
        '/class_works': (context) => const ClassWorksScreen(),
        '/academic': (context) => const AcademicScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/back-office': (context) => const BackOfficeScreen(),
        '/finance': (context) => const FinanceScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
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
        scaffoldBackgroundColor: Colors.white);
  }
}
