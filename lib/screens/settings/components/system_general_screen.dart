import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form_header.dart';
import 'package:neocloud_mobile/size_config.dart';

class SettingsGeneralScreen extends StatelessWidget {
  SettingsGeneralScreen({Key? key}) : super(key: key);
  static String screenName = 'General';
  final String subText =
      "Note that whatever you change here affects the overall application (Web & Mobile)";
  final List<String> inputFieldsList = [
    'Name',
    'Title',
    'Email',
    'Phone',
    'Fax',
    'Address',
    'Purchase Code',
    'Timezone',
    'Footer Text',
    'Footer Link',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        showAction: false,
        // elevation: .5,
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Container(
          // height: SizeConfig.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              SizedBox(height: defaultSize * 3),
              SettingsFormHeader(title: '$screenName Settings', subTitle: subText),

              // Form
              SettingsForm(inputFieldsList: inputFieldsList, data: {}),
              pageBottomPadding(height: defaultSize * 6),
            ],
          ),
        ),
      ),
    );
  }
}
