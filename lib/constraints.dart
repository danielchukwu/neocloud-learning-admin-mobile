import 'package:flutter/material.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

// Images
const neocloudLogo = 'assets/images/logo-dark.png';

// Sizes (Integers and Doubles)
var defaultSize = SizeConfig.defaultSize!;

// Paddings
EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: defaultSize * 2); // 20px

// Colors
Color kBlue = const Color(0xFF1679F7);
Color kBlueLight = const Color(0xFF1679F7).withOpacity(.7);

Color kWhite   = const Color(0xFFFFFFFF);
Color kBlack   = const Color(0xFF000000);
Color kBlack50 = const Color(0xFF000000).withOpacity(.5);
Color kBlack60 = const Color(0xFF000000).withOpacity(.6);
Color kBlack70 = const Color(0xFF000000).withOpacity(.7);
Color kBlack80 = const Color(0xFF000000).withOpacity(.8);
Color kBlack90 = const Color(0xFF000000).withOpacity(.9);

const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);

// Functions
void navigateToComingSoon({BuildContext? context}) {
  Navigator.push(
    context!,
    MaterialPageRoute(
      builder: (context) => const ComingSoonScreen(),
    ),
  );
}

void navigateToProfile({BuildContext? context}) {
  Navigator.push(
    context!,
    MaterialPageRoute(
      builder: (context) => const ComingSoonScreen(),
    ),
  );
}
