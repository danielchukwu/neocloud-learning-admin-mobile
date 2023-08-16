import 'package:flutter/widgets.dart';

class SizeConfig {
  static final SizeConfig _instance = SizeConfig._();
  factory SizeConfig() => _instance;

  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static BuildContext? appContext;

  SizeConfig._(); // Private constructor

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;
    appContext = context;
  }
}