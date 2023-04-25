import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  static String screenName = 'Language';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextMedium(title: screenName),
    );
  }
}
