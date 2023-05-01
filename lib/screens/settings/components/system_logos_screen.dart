import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/gradient-card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form_header.dart';

class SystemLogosScreen extends StatelessWidget {
  SystemLogosScreen({Key? key}) : super(key: key);
  static String screenName = 'System Logos';
  final String subText =
      "Note that whatever you change here affects the overall application (Web & Mobile)";
  final List<String> logosList = [
    'assets/images/logos/logo-blue-black.png',
    'assets/images/logos/logo-blue-white.png',
    'assets/images/logos/logo-blue.png',
    'assets/images/logos/logo-white.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: '',
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        showAction: false,
        // elevation: .5,
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            SizedBox(height: defaultSize * 3),
            SettingsFormHeader(
                title: '$screenName Settings', subTitle: subText),

            // Logos
            Column(
              children: List<Widget>.generate(
                logosList.length,
                (index) => Column(
                  children: <Widget>[

                    // Card Header  (Title and Change Btn)
                    SizedBox(height: defaultSize * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextMedium(title: 'Black Logo'),
                        TextLink(title: 'Change', press: (context) {}, color: kBlue, fontSize: defaultSize * 1.6),
                      ],
                    ),

                    // Card
                    GradientCard(contentWidget: Image(
                        image: AssetImage(logosList[index]))
                    ),
                  ]
                ),
              ),
            ),

            pageBottomPadding(height: defaultSize * 6),
          ],
        ),
      ),
    );
  }
}
