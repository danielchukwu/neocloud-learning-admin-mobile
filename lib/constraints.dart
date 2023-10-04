import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/mini_course_card.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/size_config.dart';

// Sizes (Integers and Doubles)
var defaultSize = SizeConfig.defaultSize!;

// Border
BorderSide appsBorder = BorderSide(color: kBlack50, width: .2);

// Border Radius
BorderRadius appsBorderRadius = const BorderRadius.all(Radius.circular(10));

// Paddings
double appsBodyPadding = 20;
EdgeInsets screenPadding =
    EdgeInsets.symmetric(horizontal: appsBodyPadding); // 20px 20px
SizedBox pageBottomPadding({double height = 120}) => SizedBox(height: height);

// Border
double buttonBorderWidth = .5;
double buttonBorderRadius = 5;

// Colors
Color kBlue = const Color(0xFF1679F7);
Color kBlueLight = const Color(0xFF1679F7).withOpacity(.7);

Color kWhite = const Color(0xFFFFFFFF);
Color kBlack = const Color(0xFF000000);
Color kBlack50 = const Color(0xFF000000).withOpacity(.5);
Color kBlack60 = const Color(0xFF000000).withOpacity(.6);
Color kBlack70 = const Color(0xFF000000).withOpacity(.7);
Color kBlack80 = const Color(0xFF000000).withOpacity(.8);
Color kBlack90 = const Color(0xFF000000).withOpacity(.9);

// - Secondary
Color kStarColor = const Color(0XFFF7AC16);
Color kOrange = const Color(0xFFF7941D);
Color kGreen = const Color(0xFF2B5D18);
Color kRed = const Color(0xFFD0102B);

double appsSplashRadius = 50;

// FUNCTIONS

// - Styles

TextStyle appsTextStyle({
  String fontFamily = "Poppins",
  Color color = Colors.black87,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w400,
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

// void navigateToScreen(
//     {required BuildContext context, required String routeName}) {
//   Navigator.pushNamed(context, routeName);
// }

// void navigateToScreenPush(
//     {required BuildContext context, required Widget widget}) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => widget,
//       ));
// }

// void navigateToListScreen(
//     {required BuildContext context,
//     required String screenName,
//     required Widget widgetList}) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) =>
//           ListScreen(widgetList: widgetList, screenName: screenName),
//     ),
//   );
// }

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
    preferredSize: const Size.fromHeight(65),
    child: AppsAppBar(
      title: title,
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
  // if neither actionSvg or actionIcon was provided, then we want to
  // set a default actionSvg value (to be displayed)
  actionSvg1 = actionSvg1 == null && actionIcon1 == null
      ? 'assets/icons/account.svg'
      : null;

  return AppsSliverAppBar(
    title: title,
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
    height: 40,
    decoration: getDropDownBoxDecoration(),
    padding: const EdgeInsets.symmetric(horizontal: 10),
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
    padTopBottom: 3,
    borderRadius: buttonBorderRadius,
  );
}

// CARDS

// variables
EdgeInsets cardBottomMargin = const EdgeInsets.only(bottom: 20);
EdgeInsets cardPadding = const EdgeInsets.all(20);

// - e.g label
//       text
Widget buildCardHeader({required String title}) {
  return TextCustom(
    title: title,
    fontSize: 22,
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
        padTopBottom: 2,
        // borderRadius: 5,
        icon: Icons.download,
        press: press,
      ),
    ],
  );
}

// - Avatar: Username
// e.g 😎 john doe

class CircularAvartarAndName extends StatelessWidget {
  const CircularAvartarAndName({
    super.key,
    required this.avatar,
    required this.name,
    this.imgSize = 30,
    this.fontSize = 16,
    this.imgBorderSize = 0,
    this.weight = FontWeight.w400,
    this.color,
  });

  final String avatar;
  final String name;
  final double imgSize;
  final double fontSize;
  final double imgBorderSize;
  final FontWeight weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RoundBoxAvatar(
          size: imgSize,
          image: avatar,
          borderSize: imgBorderSize,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextCustomMaxLine(
            title: name,
            color: color ?? Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: fontSize,
            weight: weight,
          ),
        )
      ],
    );
    ;
  }
}

// - Mini Course Card
Widget buildSmallMiniCourseCard({required Course course}) {
  return MiniCourseCard(course: course);
}

Widget buildMediumMiniCourseCard({required Course course}) {
  return MiniCourseCard(
    course: course,
    cardSize: 200,
    fontSize: 16,
  );
}

Widget buildBigMiniCourseCard({required Course course}) {
  return MiniCourseCard(
    course: course,
    cardSize: 300,
    fontSize: 18,
  );
}
