import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/mini_course_card.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/list/list_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

// Images
const neocloudLogo = 'assets/images/logo-dark.png';

// Sizes (Integers and Doubles)
var defaultSize = SizeConfig.defaultSize!;

// Border
BorderSide appsBorder = BorderSide(color: kBlack50, width: .2);

// Paddings
double appsBodyPadding = defaultSize * 2;
EdgeInsets screenPadding =
    EdgeInsets.symmetric(horizontal: appsBodyPadding); // 20px 20px
SizedBox pageBottomPadding({double height = 120}) => SizedBox(height: height);

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
Color kStarColor = const Color(0XFFF7AC16);
Color kOrange = const Color(0xFFF7941D);
Color kGreen = const Color(0xFF2B5D18);
Color kRed = const Color(0xFFD0102B);

Color appsSplashColor = kBlack.withOpacity(.05);
double appsSplashRadius = defaultSize * 5;

// FUNCTIONS

// - Styles

TextStyle getAppsTextStyle({
  String fontFamily = "Poppins",
  Color color = Colors.black87,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w600,
  TextDecoration decoration = TextDecoration.none,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decorationStyle: TextDecorationStyle.solid,
    decoration: decoration,
  );
}

// - Navigators
void navigateToComingSoon({BuildContext? context}) {
  Navigator.push(
    context!,
    MaterialPageRoute(
      builder: (context) => const ComingSoonScreen(),
    ),
  );
}

void navigateToScreen(
    {required BuildContext context, required String routeName}) {
  Navigator.pushNamed(context, routeName);
}

void navigateToScreenPush(
    {required BuildContext context, required Widget widget}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => widget,
      ));
}

void navigateToListScreen(
    {required BuildContext context,
    required String screenName,
    required Widget widgetList}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          ListScreen(widgetList: widgetList, screenName: screenName),
    ),
  );
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
  double elevation = 0,
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
      bgColor: bgColor,
      actionIcon1: actionIcon,
      actionSvg1: actionSvg,
      showAction1: showAction,
      showLeading: showLeading,
      routeName1: routeName,
      elevation: elevation,
    ),
  );
}

AppsSliverAppBar buildSliverAppBar({
  required String title,
  bool isDark = false,
  Color? bgColor,
  bool showLeading = true,
  bool showAction1 = true,
  bool showAction2 = false,
  IconData? actionIcon1,
  IconData? actionIcon2,
  String? actionSvg1,
  String? actionSvg2,
  String routeName1 = '',
  String routeName2 = '',
  double elevation = .5,
  Widget? routeWidget1,
  Widget? routeWidget2,
  // Function(BuildContext context)? press,
}) {
  // give <kBlue> to <bgColor> if it is null
  bgColor ??= kBlue;
  // if neither actionSvg or actionIcon was provided, then we want to
  // set a default actionSvg value (to be displayed)
  actionSvg1 = actionSvg1 == null && actionIcon1 == null
      ? 'assets/icons/account.svg'
      : null;

  return AppsSliverAppBar(
    title: title,
    isDark: isDark,
    bgColor: bgColor,
    actionIcon1: actionIcon1,
    actionIcon2: actionIcon2,
    actionSvg1: actionSvg1,
    actionSvg2: actionSvg2,
    showAction1: showAction1,
    showAction2: showAction2,
    showLeading: showLeading,
    routeName1: routeName1,
    routeName2: routeName2,
    elevation: elevation,
    routeWidget1: routeWidget1,
    routeWidget2: routeWidget2,
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
AppsButton buildFilterButton({
  required Function(BuildContext? context) press,
  String buttonText = "Filter",
}) {
  return AppsButton(
    title: buttonText,
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
    press: press != null ? press : (context) {},
    icon: Icons.add,
    bgColor: kBlack80,
    padTopBottom: defaultSize * 0.3,
    borderRadius: buttonBorderRadius,
  );
}

// CARDS

// variables
EdgeInsets cardBottomMargin = EdgeInsets.only(bottom: defaultSize * 2);
EdgeInsets cardPadding = EdgeInsets.all(defaultSize * 2);

// - e.g label
//       text
Widget buildCardHeader({required String title}) {
  return TextCustom(
    title: title,
    fontSize: defaultSize * 2.2,
    color: kBlack80,
    weight: FontWeight.w600,
  );
}

// - image or file display

// Widget buildImageOrFileName({required String file}) {
//   if (file.contains(".jpg") || file.contains(".png")) {
//     return RectangularBoxImage(img: file);
//   } else {
//     return DisplayFileName(title: file);
//   }
// }

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
Row buildAvatarAndName({
  required String avatar,
  required String name,
  double imgSize = 30,
  double fontSize = 16,
  double imgBorderSize = 0,
  FontWeight weight = FontWeight.w400,
  Color? color,
}) {
  return Row(
    children: <Widget>[
      RoundBoxAvatar(
        width: imgSize,
        height: imgSize,
        image: avatar,
        borderSize: imgBorderSize,
      ),
      SizedBox(width: defaultSize),
      Expanded(
        child: TextCustomMaxLine(
          title: name,
          color: color ?? kBlack70,
          fontSize: fontSize,
          weight: weight,
        ),
      )
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

// - Mini Course Card
Widget buildSmallMiniCourseCard({required Course course}) {
  return MiniCourseCard(course: course);
}

Widget buildMediumMiniCourseCard({required Course course}) {
  return MiniCourseCard(
    course: course,
    cardSize: defaultSize * 20,
    fontSize: defaultSize * 1.6,
  );
}

Widget buildBigMiniCourseCard({required Course course}) {
  return MiniCourseCard(
    course: course,
    cardSize: defaultSize * 30,
    fontSize: defaultSize * 1.8,
  );
}
