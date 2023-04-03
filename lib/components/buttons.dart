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
    required this.color,
    required this.press,
    this.padTopBottom = 10,
  });

  final String title;
  final Color color;
  final Function(BuildContext? context) press;
  final double padTopBottom;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => press(context),
      style: buildButtonStyle(),
      child: Container(
        // width: defaultSize * 22,
        padding: EdgeInsets.symmetric(vertical: padTopBottom),
        child: Stack(
          children: [
            Center(
              child: TextSmall(
                  title: title, color: Colors.white, weight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(color),
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