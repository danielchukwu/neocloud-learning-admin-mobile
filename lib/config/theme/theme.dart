import 'package:flutter/material.dart';
import 'package:neocloud_mobile/size_config.dart';

class AppTheme {
  const AppTheme._();

  static var lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: _primarySwatch(),
    // colorScheme: ColorScheme(brightness: Brightness.light, error: Color(0xFFeb4d4b)),
    primaryColor: const Color(0xFF6699FF),
    canvasColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: _lightAppBarTheme(),
    textTheme: _lightTextTheme(),
    inputDecorationTheme: _lightInputDecorationTheme(),
    outlinedButtonTheme: _lightOutlinedButtonTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
  );

  static var darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: _primarySwatch(),
    primaryColor: const Color(0xFF6699FF),
    canvasColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: _darkAppBarTheme(),
    textTheme: _darkTextTheme(),
    inputDecorationTheme: _darkInputDecorationTheme(),
    outlinedButtonTheme: _darkOutlinedButtonTheme(),
    scaffoldBackgroundColor: const Color(0xFF000000),
  );
}

InputDecorationTheme _lightInputDecorationTheme() {
  return const InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.black54,
      fontSize: 14,
      decorationStyle: TextDecorationStyle.solid,
      decoration: TextDecoration.none,
    ),
  );
}

InputDecorationTheme _darkInputDecorationTheme() {
  return const InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.white54,
      fontSize: 14,
      decorationStyle: TextDecorationStyle.solid,
      decoration: TextDecoration.none,
    ),
  );
}

OutlinedButtonThemeData _lightOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}

OutlinedButtonThemeData _darkOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade900),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}

TextTheme _lightTextTheme() {
  return TextTheme(
    // body (sm)
    bodySmall: TextStyle(color: Colors.grey.shade700, fontSize: 14),
    bodyMedium: TextStyle(color: Colors.grey.shade700, fontSize: 16),
    bodyLarge: TextStyle(color: Colors.grey.shade700, fontSize: 18),
    // label (md)
    labelSmall: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 16, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 18, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 20, fontWeight: FontWeight.w500),
    // title (lg)
    titleSmall:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 18, fontWeight: FontWeight.w600),
    titleMedium:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 22, fontWeight: FontWeight.w600),
    // display (xl)
    displaySmall:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 20, fontWeight: FontWeight.w700),
    displayMedium:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 22, fontWeight: FontWeight.w700),
    displayLarge:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 24, fontWeight: FontWeight.w700),
    // headline (xxl)
    headlineSmall:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 26, fontWeight: FontWeight.w700),
    headlineMedium:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 28, fontWeight: FontWeight.w700),
    headlineLarge:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 30, fontWeight: FontWeight.w700),
  );
}

TextTheme _darkTextTheme() {
  return const TextTheme(
    // body (sm)
    bodySmall: TextStyle(color: Colors.white70, fontSize: 14),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
    bodyLarge: TextStyle(color: Colors.white70, fontSize: 18),
    // label (md)
    labelSmall: TextStyle(
        color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(
        color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w500),
    // title (lg)
    titleSmall: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
    // display (xl)
    displaySmall: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
    // headline (xxl)
    headlineSmall: TextStyle(
        color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
  );
}

// TextStyle _getTextStyle({required Color color, required double fontSize, FontWeight ? fontWeight}) {
//   return TextStyle(
//       fontFamily: 'Poppins',
//       color: color,
//       fontSize: fontSize,
//       fontWeight: fontWeight ?? FontWeight.w400,
//     );
// }

AppBarTheme _lightAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
  );
}

AppBarTheme _darkAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: Color(0xFF000000),
    centerTitle: true,
  );
}

MaterialColor _primarySwatch() {
  return const MaterialColor(
    0xFF6699FF,
    <int, Color>{
      50: Color(0x1A6699FF),
      100: Color(0x336699FF),
      200: Color(0x4D6699FF),
      300: Color(0x806699FF),
      400: Color(0xB36699FF),
      500: Color(0xFF6699FF),
      600: Color(0x801679F7),
      700: Color(0x991679F7),
      800: Color(0xB31679F7),
      900: Color(0xFF1679F7),
    },
  );
}
