import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/actions.dart';
import 'package:neocloud_mobile/components/appbar/leading.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class AppsAppBar extends StatelessWidget {
  const AppsAppBar({
    super.key,
    required this.screenName,
    this.isDark = false,
  });

  final String screenName;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBlue,
      leadingWidth: defaultSize * 6,
      leading: LeadingBackButton(isDark: isDark),
      title: TextExtraLarge(
        title: screenName,
        weight: FontWeight.w600,
        color: isDark ? kBlack80 : Colors.white,
      ),
      actions: <Widget>[
        actionUserButton(isDark: isDark),
        SizedBox(width: defaultSize * 1.5),
      ],
    );
  }
}