import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/models/Settings.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_list.dart';

class SystemScreen extends StatelessWidget {
  const SystemScreen({Key? key}) : super(key: key);
  static String screenName = 'System';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: getColorOpposite(Theme.of(context).canvasColor),
        isDark: true,
        showLeading: true,
        showAction: false,
        elevation: .5,
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          children: [
            // General Settings
            const SizedBox(height: 10),

            SettingsList(list: settingsSystemList)
          ],
        ),
      ),
    );
  }
}
