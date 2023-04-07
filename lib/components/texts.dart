import 'package:flutter/material.dart';
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

