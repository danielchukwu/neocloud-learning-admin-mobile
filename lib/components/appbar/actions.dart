import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/constraints.dart';

class actionUserButton extends StatelessWidget {
  const actionUserButton({
    super.key,
    this.icon,
    this.svg,
    this.isDark = false,
    required this.routeName,
  });

  // either <svg> or <icon> is required for in other for something
  // to be displayed
  final IconData? icon;
  final String? svg;
  // action button is dark when this <isDark> is true and white when <isDark>
  // is false
  final bool isDark;
  // the route to be navigated to when this action button is clicked on
  final String routeName;
  // final Function(BuildContext context) press;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // backgroundColor: (isDark ? kBlack : kWhite).withOpacity(.1),
      backgroundColor: Colors.transparent,
      child: IconButton(
        onPressed: () => navigateToScreen(context: context, routeName: routeName),
        icon: svg != null
            ? SvgPicture.asset(
                svg!,
                width: 20,
                color: isDark ? kBlack.withOpacity(.7) : kWhite,
              )
            : Icon(
                icon != null ? icon : Icons.cancel,
                color: isDark ? kBlack.withOpacity(.7) : kWhite,
              ),
      ),
    );
  }
}
