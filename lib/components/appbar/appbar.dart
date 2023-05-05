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
    this.showLeading = true,
    this.elevation = 0,

    // Action Buttons Related
    this.actionIcon1,
    this.actionIcon2,
    this.actionSvg1,
    this.actionSvg2,
    this.showAction1 = true,
    this.showAction2 = false,
    this.routeName1 = '',
    this.routeName2 = '',
    this.routeWidget1,
    this.routeWidget2,
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

  // if this is true then the left icon is displayed, else it is not displayed
  final bool showLeading;

  // if this is true then the right icon is displayed, else it is not displayed
  final bool showAction1;
  final bool showAction2;

  // this is an IconData and it can be null or not, if it isn't null then
  // we display an Icon() to the right
  final IconData? actionIcon1;
  final IconData? actionIcon2;

  // this can be null or not, if it isn't then we display an svg using
  // SvgPicture.asset() and
  // We expect either <actionIcon> field above or the <actionSvg> field to be
  // null, so that the other can render
  final String? actionSvg1;
  final String? actionSvg2;

  // Replacement
  // this is a callback function that is called when the action icon or svg
  // Function(BuildContext context)? pressAction;


  // the elevation of the appBar
  final double elevation;

  // NOTE: Either we use `routeWidget` or `routeName` for action buttons navigation

  // routeName to be navigated to when the actionIcon or Svg is clicked on
  final String routeName1;
  final String routeName2;

  // routeWidget to be navigated to using push. Allows us to pass data to 
  // screens whose constructors requires passed in valued
  final Widget? routeWidget1;
  final Widget? routeWidget2;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      leadingWidth: defaultSize * 6,
      elevation: elevation,
      leading:
          showLeading ? LeadingBackButton(isDark: isDark) : const SizedBox(),
      title: TextLarge(
        title: title,
        weight: FontWeight.w600,
        color: isDark ? kBlack80 : Colors.white,
      ),
      actions: showAction1
          ? <Widget>[
              actionUserButton(
                icon: actionIcon1,
                svg: actionSvg2,
                isDark: isDark,
                routeName: routeName2,
                routeWidget: routeWidget2,
              ),
              actionUserButton(
                icon: actionIcon1,
                svg: actionSvg1,
                isDark: isDark,
                routeName: routeName1,
                routeWidget: routeWidget1,
              ),
            ]
          : [],
    );
  }
}

class AppsSliverAppBar extends AppsAppBar {
  AppsSliverAppBar({
    required super.title,
    super.bgColor,
    super.isDark,
    super.actionIcon1,
    super.actionIcon2 = Icons.search,
    super.actionSvg1,
    super.actionSvg2,
    super.showLeading,
    super.showAction1,
    super.showAction2,
    super.routeName1,
    super.routeName2,
    super.routeWidget1,
    super.routeWidget2,
    super.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: bgColor,
      leadingWidth: defaultSize * 6,
      // expandedHeight: defaultSize * 6.5,
      elevation: elevation,
      floating: true,
      snap: true,
      leading:
          showLeading ? LeadingBackButton(isDark: isDark) : const SizedBox(),
      title: TextLarge(
        title: title,
        weight: FontWeight.w600,
        color: isDark ? kBlack80 : Colors.white,
      ),
      actions: <Widget>[
        showAction2
            ? actionUserButton(
                icon: actionIcon2,
                svg: actionSvg2,
                isDark: isDark,
                routeName: routeName2,
                routeWidget: routeWidget2,
              )
            : SizedBox(),
        showAction1
            ? actionUserButton(
                icon: actionIcon1,
                svg: actionSvg1,
                isDark: isDark,
                routeName: routeName1,
                routeWidget: routeWidget1,
              )
            : SizedBox(),
      ],
    );
  }
}
