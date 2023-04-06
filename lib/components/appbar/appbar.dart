import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/actions.dart';
import 'package:neocloud_mobile/components/appbar/leading.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class AppsAppBar extends StatelessWidget {
  AppsAppBar({
    super.key,
    required this.title,
    this.bgColor = Colors.white,
    this.isDark = true,
    this.actionIcon,
    this.actionSvg,
    this.showLeading = true,
    this.showAction = true,
    this.routeName = '',
    // this.pressAction,
  });

  // Title of the appbar
  final String title;

  // the background color of the appbar
  final Color bgColor;

  // this decides what the color of the title and the icons of the appbar
  // are going to be.
  // if isDark=true then the title, left icon and right icon are going to
  // be {black}, else if isDark=false then they are all going to be {white}
  final bool isDark;

  // if this is true then the right icon is displayed, else it is not displayed
  final bool showAction;

  // if this is true then the left icon is displayed, else it is not displayed
  final bool showLeading;

  // this is an IconData and it can be null or not, if it isn't null then
  // we display an Icon() to the right
  final IconData? actionIcon;

  // this can be null or not, if it isn't then we display an svg using
  // SvgPicture.asset() and
  // We expect either <actionIcon> field above or the <actionSvg> field to be
  // null, so that the other can render
  final String? actionSvg;

  // Replacement
  // this is a callback function that is called when the action icon or svg
  // Function(BuildContext context)? pressAction;

  // routeName to be navigated to when the actionIcon or Svg is clicked on
  final String routeName;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      leadingWidth: defaultSize * 6,
      leading:
          showLeading ? LeadingBackButton(isDark: isDark) : const SizedBox(),
      title: TextExtraLarge(
        title: title,
        weight: FontWeight.w600,
        color: isDark ? kBlack70 : Colors.white,
      ),
      actions: <Widget>[
        showAction
            ? actionUserButton(
                icon: actionIcon,
                svg: actionSvg,
                isDark: isDark,
                routeName: routeName,
              )
            : SizedBox(),
        SizedBox(width: defaultSize * 1.5),
      ],
    );
  }
}
