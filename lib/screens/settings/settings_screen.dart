import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Settings.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_list.dart';
import 'package:neocloud_mobile/screens/settings/screens/manage_account_screen.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String screenName = "Settings";

  @override
  Widget build(BuildContext context) {
    print(getRouteName(ManageAccountScreen.screenName));
    return Scaffold(
      appBar: buildAppBar(
        title: SettingsScreen.screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        showAction: false,
        elevation: .5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // General Settings
            SizedBox(height: defaultSize),
            Padding(
                padding: screenPadding,
                child: SettingsList(list: settingsMainList, actionTextBoxWidth: SizeConfig.screenWidth! / 3,)),

            // Account Settings
            Divider(),
            Padding(
                padding: screenPadding,
                child: SettingsList(list: settingsAccountList)),
          ],
        ),
      ),
    );
  }
}