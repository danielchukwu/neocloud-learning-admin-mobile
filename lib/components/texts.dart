import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class TextSmall extends StatelessWidget {
  const TextSmall(
      {super.key,
      required this.title,
      this.color,
      this.weight = FontWeight.w400,
      this.textAlign = TextAlign.start});

  final TextAlign textAlign;
  final String title;
  final Color? color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color ?? kBlack70,
        fontSize: defaultSize * 1.4,
        fontWeight: weight,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium(
      {super.key,
      required this.title,
      this.color = Colors.black87,
      this.weight = FontWeight.w400,
      this.textAlign = TextAlign.start});

  final TextAlign textAlign;
  final String title;
  final Color? color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color ?? kBlack70,
        fontSize: defaultSize * 1.6,
        fontWeight: weight,
      ),
    );
  }
}

class TextLarge extends StatelessWidget {
  const TextLarge(
      {super.key,
      required this.title,
      this.color,
      this.weight = FontWeight.w400,
      this.textAlign = TextAlign.start});

  final TextAlign textAlign;
  final String title;
  final Color? color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color ?? kBlack70,
        fontSize: defaultSize * 1.8,
        fontWeight: weight,
      ),
    );
  }
}

class TextExtraLarge extends StatelessWidget {
  const TextExtraLarge(
      {super.key,
      required this.title,
      this.color,
      this.weight = FontWeight.w400,
      this.textAlign = TextAlign.start});

  final TextAlign textAlign;
  final String title;
  final Color? color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color ?? kBlack70,
        fontSize: defaultSize * 2,
        fontWeight: weight,
      ),
    );
  }
}

class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.title,
      required this.fontSize,
      this.color,
      this.weight = FontWeight.w400,
      this.textAlign = TextAlign.start});

  final TextAlign textAlign;
  final String title;
  final double fontSize;
  final Color? color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color ?? kBlack70,
        fontSize: fontSize,
        fontWeight: weight,
      ),
    );
  }
}

class TextCustomMaxLine extends StatelessWidget {
  const TextCustomMaxLine({
    super.key,
    required this.title,
    required this.fontSize,
    this.color,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.lineHeight = 1.5,
  });

  final TextAlign textAlign;
  final String title;
  final double fontSize;
  final Color? color;
  final FontWeight weight;
  final int maxLines;
  final TextOverflow overflow;
  final double lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color ?? kBlack70,
        fontSize: fontSize,
        fontWeight: weight,
        height: lineHeight,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.title,
    this.icon,
    this.svg,
    this.iconSize = 16,
    this.iconColor,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.iconIsLeft = true,
  });

  final IconData? icon;
  final String? svg;
  final String title;
  final double iconSize;
  final Color? iconColor;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final bool iconIsLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        iconIsLeft
            ? IconOrSvg(
                svg: svg,
                icon: icon,
                color: iconColor,
                size: iconSize,
              )
            : SizedBox(),

        // Count
        iconIsLeft ? SizedBox(width: defaultSize * .5) : SizedBox(),
        TextCustom(
          title: title,
          color: color ?? kBlack70,
          fontSize: fontSize,
          weight: fontWeight,
        ),

        // Icon
        !iconIsLeft ? SizedBox(width: defaultSize * .5) : SizedBox(),
        !iconIsLeft
            ? IconOrSvg(
                svg: svg,
                icon: icon,
                color: iconColor,
                size: iconSize,
              )
            : SizedBox(),
      ],
    );
  }
}

class AppsTextRich extends StatelessWidget {
  const AppsTextRich({
    super.key,
    required this.text1,
    required this.text2,
    this.text1Color = Colors.black54,
    this.text2Color = Colors.black87,
    this.text1FontSize = 16,
    this.text2FontSize = 16,
    this.text1FontWeight = FontWeight.w400,
    this.text2FontWeight = FontWeight.w400,
    this.text1Decoration = TextDecoration.none,
    this.text2Decoration = TextDecoration.none,
  });

  final String text1;
  final String text2;
  final Color text1Color;
  final Color text2Color;
  final double text1FontSize;
  final double text2FontSize;
  final FontWeight text1FontWeight;
  final FontWeight text2FontWeight;
  final TextDecoration text1Decoration;
  final TextDecoration text2Decoration;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: getAppsTextStyle(
            color: text1Color,
            fontSize: text1FontSize,
            fontWeight: text1FontWeight,
            decoration: text1Decoration),
        children: [
          TextSpan(
            text: text2,
            style: getAppsTextStyle(
              color: text2Color,
              fontSize: text2FontSize,
              fontWeight: text2FontWeight,
              decoration: text2Decoration,
            ),
          ),
        ],
      ),
    );
  }
}

class TextSeeMore extends StatefulWidget {
  const TextSeeMore({
    super.key,
    required this.text,
    this.color,
    this.seeMoreColor,
    this.maxLines = 5,
    this.fontSize = 16,
  });

  final String text;
  final Color? color;
  final Color? seeMoreColor;
  final int maxLines;
  final double fontSize;

  @override
  State<TextSeeMore> createState() => _TextSeeMoreState();
}

class _TextSeeMoreState extends State<TextSeeMore> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextCustomMaxLine(
          title: widget.text,
          fontSize: widget.fontSize,
          color: widget.color ?? kBlack70,
          maxLines: !showMore ? widget.maxLines : 200,
        ),
        SizedBox(
          height: widget.text.length > 215 ? defaultSize * 1 : 0,
        ),
        widget.text.length > 215
            ? TextLink(
                title: !showMore ? "See more" : "See less",
                color: widget.seeMoreColor ?? kBlue,
                fontSize: defaultSize * 1.6,
                weight: FontWeight.w600,
                press: (_) => setState(() => showMore = !showMore),
              )
            : SizedBox(),
      ],
    );
  }
}

// Link Button
class TextLink extends StatelessWidget {
  const TextLink({
    super.key,
    required this.title,
    required this.press,
    this.color = Colors.black87,
    this.fontSize = 14,
    this.weight = FontWeight.w400,
  });

  final String title;
  final Function(BuildContext context) press;
  final Color? color;
  final double fontSize;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(context),
      child: TextCustom(
        title: title,
        fontSize: fontSize,
        weight: weight,
        color: color ?? kBlack70,
      ),
    );
  }
}


// This takes a users name and role, then it returns the 
// name with a role icon by it's side. e.g Edwin Vladimir⚡, Godstime Edet 🙍‍♂️
// Widget TextRoleIcon({
//     required String title,
//     required String svg,
//     Color? color,
//     FontWeight weight = FontWeight.w500,
//     double fontSize = 16,
//     double iconSize = 16,
//   }) {
    
//     return IconText(
//       title: title,
//       color: color ?? kBlack80,
//       fontWeight: weight,
//       fontSize: fontSize,
//       iconIsLeft: false,
//       svg: svg,
//       iconSize: iconSize,
//     );
//   }