import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Settings.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_list.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({Key? key}) : super(key: key);
  static String screenName = 'Manage Account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
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
                child: SettingsList(list: settingsManageAccountList),
            ),
          ],
        ),
      ),
    );
  }
}
