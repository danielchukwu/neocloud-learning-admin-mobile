import 'package:flutter/material.dart';
import 'package:neocloud_mobile/screens/loading/loading_screen.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';
import 'package:neocloud_mobile/screens/welcome/welcome_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: buildTheme(),
      initialRoute: '/welcome',
      routes: {
        '/':(context) => const LoadingScreen(),
        '/login': (context) => const LoginScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/loading':(context) => const LoadingScreen(),
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
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16
        ),
      ),
      scaffoldBackgroundColor: Colors.white
    );
  }
}
