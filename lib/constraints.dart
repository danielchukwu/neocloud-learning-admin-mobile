import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/components/card_intro.dart';
import 'package:neocloud_mobile/components/cards/components/display_filename.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

// Images
const neocloudLogo = 'assets/images/logo-dark.png';

// Sizes (Integers and Doubles)
var defaultSize = SizeConfig.defaultSize!;

// Paddings
double appsBodyPadding = defaultSize * 2;
EdgeInsets screenPadding =
    EdgeInsets.symmetric(horizontal: appsBodyPadding); // 20px 20px
SizedBox pageBottomPadding ({double height = 30}) => SizedBox(height: height);

// Border
double buttonBorderWidth = defaultSize * .05;
double buttonBorderRadius = defaultSize * .5;

// Colors
Color kBlue = const Color(0xFF1679F7);
Color kBlueLight = const Color(0xFF1679F7).withOpacity(.7);
// Color kBlue = const Color(0xFF6699FF);
// Color kBlueLight = const Color(0xFF6699FF).withOpacity(.7);

Color kWhite = const Color(0xFFFFFFFF);
Color kBlack = const Color(0xFF000000);
Color kBlack50 = const Color(0xFF000000).withOpacity(.5);
Color kBlack60 = const Color(0xFF000000).withOpacity(.6);
Color kBlack70 = const Color(0xFF000000).withOpacity(.7);
Color kBlack80 = const Color(0xFF000000).withOpacity(.8);
Color kBlack90 = const Color(0xFF000000).withOpacity(.9);

const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);

// - Secondary
Color kOrange = const Color(0xFFF7941D);
Color kGreen = const Color(0xFF2B5D18);
Color kRed = const Color(0xFFD0102B);

// FUNCTIONS

// - Styles

TextStyle getAppsTextStyle({
  String fontFamily = "Poppins",
  Color color = Colors.black87,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w600,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

// - Navigations
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
      builder: (context) => ProfileScreen(),
    ),
  );
}

void navigateToScreen(
    {required BuildContext context, required String routeName}) {
  Navigator.pushNamed(context, routeName);
}

// - Build Widgets
PreferredSize buildAppBar({
  required String title,
  bool isDark = false,
  Color? bgColor,
  bool showAction = true,
  bool showLeading = true,
  IconData? actionIcon,
  String? actionSvg,
  String routeName = '',
  // Function(BuildContext context)? press,
}) {
  // give <kBlue> to <bgColor> if it is null
  bgColor ??= kBlue;
  // if neither actionSvg or actionIcon was provided, then we want to
  // set a default actionSvg value (to be displayed)
  actionSvg = actionSvg == null && actionIcon == null
      ? 'assets/icons/account.svg'
      : null;

  return PreferredSize(
    preferredSize: Size.fromHeight(defaultSize * 6.5),
    child: AppsAppBar(
      title: title,
      isDark: isDark,
      bgColor: bgColor!,
      actionIcon: actionIcon,
      actionSvg: actionSvg,
      showAction: showAction,
      showLeading: showLeading,
      routeName: routeName,
    ),
  );
}

AppsSliverAppBar buildSliverAppBar({
  required String title,
  bool isDark = false,
  Color? bgColor,
  bool showAction = true,
  bool showLeading = true,
  IconData? actionIcon,
  String? actionSvg,
  String routeName = '',
  // Function(BuildContext context)? press,
}) {
  // give <kBlue> to <bgColor> if it is null
  bgColor ??= kBlue;
  // if neither actionSvg or actionIcon was provided, then we want to
  // set a default actionSvg value (to be displayed)
  actionSvg = actionSvg == null && actionIcon == null
      ? 'assets/icons/account.svg'
      : null;

  return AppsSliverAppBar(
    title: title,
    isDark: isDark,
    bgColor: bgColor!,
    actionIcon: actionIcon,
    actionSvg: actionSvg,
    showAction: showAction,
    showLeading: showLeading,
    routeName: routeName,
  );
}

// Build AppsDropdownButton
Container buildAppsDropdownButton({
  required List<String> list,
  required Function(String value) press,
  String? selected,
}) {
  return Container(
    height: defaultSize * 4,
    decoration: getDropDownBoxDecoration(),
    padding: EdgeInsets.symmetric(horizontal: defaultSize),
    child: AppsDropdownButton(list: list, selected: selected, press: press),
  );
}

BoxDecoration getDropDownBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: buttonBorderWidth, color: kBlack50),
    borderRadius: BorderRadius.circular(buttonBorderRadius),
  );
}

// build Filter Button
AppsButton buildFilterButton({required Function(BuildContext? context) press}) {
  return AppsButton(
    title: "Filter",
    press: press,
    bgColor: kBlack80,
    icon: null,
    borderRadius: buttonBorderRadius,
    padTopBottom: 2,
  );
}

AppsButton buildAddButton({
  String title = "add",
  Function(BuildContext? context)? press,
}) {
  return AppsButton(
    title: title,
    press: press != null ? press! : (context) {},
    icon: Icons.add,
    bgColor: kBlack80,
    padTopBottom: defaultSize * 0.3,
    borderRadius: buttonBorderRadius,
  );
}


// CARDS

// variables
EdgeInsets cardTopMargin = EdgeInsets.only(top: defaultSize * 2);
EdgeInsets cardPadding = EdgeInsets.all(defaultSize * 2);

// card decoration
BoxDecoration buildCardDecoration() {
  return BoxDecoration(
    border: Border.all(color: kBlack.withOpacity(.2), width: defaultSize * .1),
    borderRadius: BorderRadius.circular(defaultSize * 3),
  );
}

// - e.g label
//       text
CardHeader buildLabelAndText({required String label, required String text}) {
  return CardHeader(
    label: label,
    title: text,
    textSize: defaultSize * 1.6,
    labelSize: defaultSize * 1.4,
  );
}

// - image or file display

Widget buildImageOrFileName({required String file}) {
  if (file.contains(".jpg") || file.contains(".png")) {
    return RectangularBoxImage(img: file);
  } else {
    return DisplayFileName(title: file);
  }
}

// - download button

Row buildDownloadButton({required Function(BuildContext? context) press}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      // Download Button
      AppsButton(
        title: "download",
        bgColor: kBlack80,
        padTopBottom: defaultSize * .2,
        // borderRadius: defaultSize * .5,
        icon: Icons.download,
        press: press,
      ),
    ],
  );
}

// - Avatar: Username
// e.g 😎 john doe
Row buildAvatarAndName({required String avatar, required String name}) {
  return Row(
    children: <Widget>[
      RoundBoxAvatar(width: defaultSize * 3, height: defaultSize * 3, image: avatar,),
      Column(children: [TextMedium(title: name, color: kBlack70,)],)
    ],
  );
}

// - Search TextField
Widget buildSearchTextField({required Function(String value) press}) {
  return AppsTextField(
    prefixIcon: Icons.search,
    hintText: "Search",
    onSubmitPress: press,
  );
}
