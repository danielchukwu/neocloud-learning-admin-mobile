// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/models/Settings.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_list.dart';
import 'package:neocloud_mobile/screens/settings/screens/manage_account_screen.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/utils.dart';

// @RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String screenName = "settings";

  @override
  Widget build(BuildContext context) {
    print(getRouteName(ManageAccountScreen.screenName));
    return Scaffold(
      appBar: buildAppBar(
        title: SettingsScreen.screenName,
        bgColor: getColorOpposite(Theme.of(context).canvasColor),
        isDark: true,
        showLeading: true,
        showAction: false,
        elevation: .5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // General Settings
            const SizedBox(height: 10),
            Padding(
                padding: screenPadding,
                child: SettingsList(list: settingsMainList, actionTextBoxWidth: SizeConfig.screenWidth! / 3,)),

            // Account Settings
            const Divider(),
            Padding(
                padding: screenPadding,
                child: SettingsList(list: settingsAccountList)),
          ],
        ),
      ),
    );
  }
}