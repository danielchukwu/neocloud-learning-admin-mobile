import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

// Welcome Button
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

// Apps Main Button
class AppsButton extends StatelessWidget {
  const AppsButton({
    super.key,
    required this.title,
    required this.press,
    this.icon,
    this.color = Colors.white,
    this.iconColor = Colors.white,
    this.bgColor = Colors.blueAccent,
    this.border = 0,
    this.borderRadius = 10,
    this.textIconSeperationSize = 5,
    this.padTopBottom = 10,
    this.padLeftRight = 10, 
    this.weight = FontWeight.w400,
  });

  final String title;
  final Color color;
  final Color bgColor;
  final Color iconColor;
  final IconData? icon;
  final double border;
  final double borderRadius;
  final double textIconSeperationSize;
  final Function(BuildContext? context) press;
  final double padTopBottom;
  final double padLeftRight;
  final FontWeight weight;

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
              color: color,
              weight: weight,
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(bgColor),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: border > 0
              ? BorderSide(width: border, color: kBlack50)
              : BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

class AppsIconButton extends AppsButton {
  AppsIconButton({
    super.title = "",
    required super.press,
    super.icon,
    super.iconColor = Colors.black87,
    super.bgColor,
    super.borderRadius,
    super.padTopBottom = 18,
    super.padLeftRight = 18,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press(context),
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: padTopBottom,
          horizontal: padLeftRight,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
        ),
        child: Center(child: Icon(icon, color: iconColor,)),
      ),
    );
  }
}

// Option Button
class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.title,
    required this.press,
    this.bgColor = Colors.transparent,
  }) : super(key: key);

  final String title;
  final Color bgColor;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return AppsButton(
      title: title,
      borderRadius: buttonBorderRadius,
      bgColor: bgColor,
      color: bgColor == kBlueLight? kWhite : kBlack70,
      press: (context) => press(),
      padTopBottom: .5,
      weight: bgColor == kBlueLight? FontWeight.w600 : FontWeight.w400,
    );
  }
}

// Dropdown Button
class AppsDropdownButton extends StatefulWidget {
  const AppsDropdownButton({
    super.key,
    required this.list,
    required this.press,
    this.selected,
  });

  final List<String> list;
  final Function(String value) press;
  final String? selected;

  @override
  State<AppsDropdownButton> createState() => _AppsDropdownButtonState();
}

class _AppsDropdownButtonState extends State<AppsDropdownButton> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue =
        widget.selected != null ? widget.selected : widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (String? pick) {
        setState(() {
          dropdownValue = pick!;
          widget.press(pick);
        });
      },
      value: dropdownValue,
      isExpanded: true,
      underline: Container(height: 0),
      items: widget.list.map((String month) {
        return DropdownMenuItem(
          child:
              TextSmall(title: month, color: kBlack50, weight: FontWeight.w500),
          value: month,
        );
      }).toList(),
    );
  }
}
