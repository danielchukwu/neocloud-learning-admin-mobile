import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class TextSmall extends StatelessWidget {
  TextSmall({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start
  });

  final TextAlign textAlign;
  final String title;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: defaultSize * 1.4,
        fontWeight: weight,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium({
    super.key,
    required this.title,
    this.color = Colors.black87,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start
  });

  final TextAlign textAlign;
  final String title;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: defaultSize * 1.6,
        fontWeight: weight,
      ),
    );
  }
}

class TextLarge extends StatelessWidget {
  const TextLarge({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start
  });

  final TextAlign textAlign;
  final String title;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: defaultSize * 1.8,
        fontWeight: weight,
      ),
    );
  }
}

class TextExtraLarge extends StatelessWidget {
  const TextExtraLarge({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start
  });

  final TextAlign textAlign;
  final String title;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: defaultSize * 2,
        fontWeight: weight,
      ),
    );
  }
}

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.title,
    required this.fontSize,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start
  });

  final TextAlign textAlign;
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
      ),
    );
  }
}


class TextCustomMaxLine extends StatelessWidget{
  const TextCustomMaxLine({
    super.key,
    required this.title,
    required this.fontSize,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  final TextAlign textAlign;
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight weight;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
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
  });

  final IconData? icon;
  final String? svg;
  final String title;
  final double iconSize;
  final Color? iconColor;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        IconOrSvg(
          svg: svg,
          icon: icon,
          color: iconColor ?? kBlack60,
          size: iconSize,
        ),
        // Count
        SizedBox(width: defaultSize * .5),
        TextCustom(
          title: title,
          color: color ?? kBlack70,
          fontSize: fontSize,
          weight: fontWeight,
        )
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
  });

  final String text1;
  final String text2;
  final Color text1Color;
  final Color text2Color;
  final double text1FontSize;
  final double text2FontSize;
  final FontWeight text1FontWeight;
  final FontWeight text2FontWeight;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: getAppsTextStyle(
            color: text1Color,
            fontSize: text1FontSize,
            fontWeight: text1FontWeight),
        children: [
          TextSpan(
            text: text2,
            style: getAppsTextStyle(
                color: text2Color,
                fontSize: text2FontSize,
                fontWeight: text2FontWeight),
          ),
        ],
      ),
    );
  }
}
