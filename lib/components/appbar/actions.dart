import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/constraints.dart';

class actionUserButton extends StatelessWidget {
  const actionUserButton({
    super.key,
    this.icon,
    this.svg,
    this.isDark = false,
    required this.press,
  });

  final IconData? icon;
  final String? svg;
  final bool isDark;
  final Function(BuildContext context) press;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: (isDark ? kBlack : kWhite).withOpacity(.1),
      child: IconButton(
        onPressed: () => press(context),
        icon: svg != null
            ? SvgPicture.asset(
                svg!,
                width: 20,
                color: isDark ? kBlack.withOpacity(.7) : kWhite,
              )
            : Icon(
                icon != null ? icon : Icons.cancel,
                color: isDark ? kBlack90 : kWhite,
              ),
      ),
    );
  }
}
