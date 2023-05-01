import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form_header.dart';
import 'package:neocloud_mobile/size_config.dart';

class SmtpScreen extends StatelessWidget {
  SmtpScreen({Key? key}) : super(key: key);
  static String screenName = 'Smtp';
  final String subText =
      'Note that whatever you change here affects the overall application (Web & Mobile)';
  final List<String> inputFieldsList = [
    "Mail Sender",
    "Protocol",
    "Host",
    "Port",
    "Username",
    "Password",
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
            SettingsFormHeader(title: 'SMTP Settings', subTitle: subText),

            // Form
            SettingsForm(inputFieldsList: inputFieldsList, data: {}),
          ],
        ),
      ),
    );
  }
}

