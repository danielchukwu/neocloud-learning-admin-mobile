import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_form_header.dart';
import 'package:neocloud_mobile/size_config.dart';

class SettingsEditScreen extends StatelessWidget {
  SettingsEditScreen({
    Key? key,
    this.screenName = '',
    required this.title,
    required this.subTitle,
    required this.inputFieldsList,
  }) : super(key: key);

  final String screenName;
  final String title;
  final String subTitle;
  final List<String> inputFieldsList;

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
          height: SizeConfig.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              SizedBox(height: defaultSize * 3),
              SettingsFormHeader(title: 'Update ${title}', subTitle: subTitle),

              // Form
              SettingsForm(inputFieldsList: inputFieldsList, data: {}),
            ],
          ),
        ),
      ),
    );
  }
}
