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
  final Function() press;
  final bool iconIsLeading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
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
    this.bgColorLoading = Colors.blue,
    this.border = 0,
    this.borderRadius = 10,
    this.textIconSeperationSize = 5,
    this.padTopBottom = 6,
    this.padLeftRight = 6, 
    this.weight = FontWeight.w400,
    this.isLoading = false,
  });

  final String title;
  final Color color;
  final Color bgColor;
  final Color bgColorLoading;
  final Color iconColor;
  final IconData? icon;
  final double border;
  final double borderRadius;
  final double textIconSeperationSize;
  final Function(BuildContext context) press;
  final double padTopBottom;
  final double padLeftRight;
  final FontWeight weight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !isLoading ? () => press(context) : null,
      style: buildButtonStyle(),
      child: Container(
        constraints: BoxConstraints(minHeight: defaultSize * 4, maxHeight: defaultSize * 4),    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Icon(icon, color: iconColor) : SizedBox(),
            icon != null ? SizedBox(width: textIconSeperationSize) : SizedBox(),
            !isLoading
              ? TextMedium(title: title, color: color, weight: weight)
              : SizedBox(height: 23, width: 23, child: CircularProgressIndicator(color: kWhite)),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(!isLoading ? bgColor : bgColorLoading),
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


// Icon Text Button
class IconTextButton extends StatelessWidget {
  const IconTextButton(this.text, {
    super.key,
    this.icon = Icons.add,
    this.iconColor = Colors.black54,
    this.textColor = Colors.black38,
    this.backgroundColor = Colors.blue,
    this.borderWidth = 1.5,
    this.borderColor = Colors.black,
    this.fullWidth = false,
    required this.press,
  });
  
  final String text;
  final IconData? icon;
  final Color iconColor;
  final Color textColor;
  final Color backgroundColor;
  final double borderWidth;
  final Color borderColor;
  final bool fullWidth;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultSize * 4.5,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: BorderRadius.circular(defaultSize)
      ),
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
          padding: MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: defaultSize * .7, vertical: 0)
          )
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black38, size: 30),
            const SizedBox(width: 5),
            TextLarge(title: text, weight: FontWeight.w500, color: textColor),
            const SizedBox(width: 5),
          ],
        ),
        ),
      );
  }
}