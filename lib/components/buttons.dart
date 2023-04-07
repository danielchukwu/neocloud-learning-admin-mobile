import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.title,
    required this.press,
    this.iconIsLeading = true,
  });

  final String title;
  final press;
  final bool iconIsLeading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => press(context),
      style: buildButtonStyle(),
      child: Container(
        // width: defaultSize * 22,
        padding: EdgeInsets.symmetric(vertical: defaultSize * 1),
        child: Stack(
          children: [
            Center(
              child: TextSmall(
                  title: title, color: Colors.white, weight: FontWeight.w500),
            ),
            // Arrow

            iconIsLeading
                ? Positioned(
                    left: defaultSize * 1.2,
                    top: defaultSize * .2,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: defaultSize * 1.6,
                    ),
                  )
                : Positioned(
                    right: defaultSize * 1.2,
                    top: defaultSize * .2,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: defaultSize * 1.6,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(kBlueLight),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

class AppsButton extends StatelessWidget {
  const AppsButton({
    super.key,
    required this.title,
    required this.press,
    this.icon,
    this.color = Colors.white,
    this.iconColor = Colors.white,
    this.bgColor = Colors.blueAccent,
    this.borderRadius = 10,
    this.textIconSeperationSize = 5,
    this.padTopBottom = 10,
    this.padLeftRight = 10,
  });

  final String title;
  final Color color;
  final Color bgColor;
  final Color iconColor;
  final IconData? icon;
  final double borderRadius;
  final double textIconSeperationSize;
  final Function(BuildContext? context) press;
  final double padTopBottom;
  final double padLeftRight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => press(context),
      style: buildButtonStyle(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: padTopBottom,
          horizontal: padLeftRight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Icon(icon, color: iconColor) : SizedBox(),
            icon != null ? SizedBox(width: textIconSeperationSize) : SizedBox(),
            TextMedium(
              title: title,
              color: kWhite,
            ),
          ],
        )
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(bgColor),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

class TextLink extends StatelessWidget {
  const TextLink({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => press(context),
      child: TextSmall(
        title: title,
        color: kBlack70,
      ),
    );
  }
}