import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';

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
      style: buildButtonStyle(context),
      child: Container(
        // width: defaultSize * 22,
        padding: EdgeInsets.symmetric(vertical: defaultSize * 1),
        child: Stack(
          children: [
            Center(
              child: Text(title,
                  style: TextStyle(
                      color: getColorOpposite(Theme.of(context).canvasColor),
                      fontWeight: FontWeight.w500)),
            ),
            // Arrow

            iconIsLeading
                ? Positioned(
                    left: defaultSize * 1.2,
                    top: defaultSize * .2,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: getColorOpposite(Theme.of(context).canvasColor),
                      size: defaultSize * 1.6,
                    ),
                  )
                : Positioned(
                    right: defaultSize * 1.2,
                    top: defaultSize * .2,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: getColorOpposite(Theme.of(context).canvasColor),
                      size: defaultSize * 1.6,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
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
  AppsButton({
    super.key,
    required this.title,
    required this.press,
    this.icon,
    this.color,
    this.iconColor,
    this.bgColor = Colors.blueAccent,
    this.bgColorLoading = Colors.blue,
    this.border = 0,
    this.borderRadius = 10,
    this.fontSize = 16,
    this.textIconSeperationSize = 5,
    this.padTopBottom = 6,
    this.padLeftRight = 6,
    this.weight = FontWeight.w400,
    this.isLoading = false,
    this.minButtonHeight = 40,
    this.maxButtonHeight = 60,
  });

  final String title;
  late Color? color;
  final Color bgColor;
  final Color bgColorLoading;
  late Color? iconColor;
  final IconData? icon;
  final double border;
  final double borderRadius;
  final double fontSize;
  final double textIconSeperationSize;
  final Function(BuildContext context) press;
  final double padTopBottom;
  final double padLeftRight;
  final FontWeight weight;
  final bool isLoading;
  final double minButtonHeight;
  final double maxButtonHeight;

  @override
  Widget build(BuildContext context) {
    color ??= Colors.white;
    iconColor ??= getColorOpposite(Theme.of(context).canvasColor);

    return TextButton(
      onPressed: !isLoading ? () => press(context) : null,
      style: buildButtonStyle(context),
      child: Container(
        constraints: BoxConstraints(
            minHeight: minButtonHeight, maxHeight: maxButtonHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Icon(icon, color: iconColor) : const SizedBox(),
            icon != null
                ? SizedBox(width: textIconSeperationSize)
                : const SizedBox(),
            isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Text(title,
                    style: TextStyle(fontFamily: 'Poppins', color: color, fontWeight: weight, fontSize: fontSize)),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(
          !isLoading ? bgColor : bgColorLoading),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: border > 0
              ? BorderSide(
                  width: border,
                  color: Theme.of(context).canvasColor.withOpacity(.5))
              : const BorderSide(color: Colors.transparent),
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
    super.iconColor,
    super.bgColor,
    super.borderRadius,
    super.padTopBottom = 18,
    super.padLeftRight = 18,
  });

  @override
  Widget build(BuildContext context) {
    iconColor ??= Theme.of(context).canvasColor.withOpacity(.8);

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
        child: Center(
            child: Icon(
          icon,
          color: iconColor,
        )),
      ),
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
          child: Text(
            month,
            style: TextStyle(
                color: Theme.of(context).canvasColor.withOpacity(.5),
                fontWeight: FontWeight.w500),
          ),
          value: month,
        );
      }).toList(),
    );
  }
}

// Icon Text Button
class IconTextButton extends StatelessWidget {
  IconTextButton(
    this.text, {
    super.key,
    this.icon = Icons.add,
    this.iconColor,
    this.textColor,
    this.backgroundColor = Colors.blue,
    this.borderWidth = 1.5,
    this.borderColor,
    this.fullWidth = false,
    required this.press,
  });

  final String text;
  final IconData? icon;
  late Color? iconColor;
  late Color? textColor;
  final Color backgroundColor;
  final double borderWidth;
  late Color? borderColor;
  final bool fullWidth;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    borderColor ??= Theme.of(context).canvasColor;
    iconColor ??= Theme.of(context).canvasColor.withOpacity(.5);
    textColor ??= Theme.of(context).canvasColor.withOpacity(.4);
    return Container(
      height: defaultSize * 4.5,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: borderWidth, color: borderColor!),
          borderRadius: BorderRadius.circular(defaultSize)),
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
            padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(
                horizontal: defaultSize * .7, vertical: 0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Icon(icon,
                color: Theme.of(context).canvasColor.withOpacity(.4), size: 30),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            // const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
