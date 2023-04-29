import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_edit_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/system_logos_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/language_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/manage_account_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/payment_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/system_general_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/smtp_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/system_screen.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class Setting {
  Setting({
    required this.title,
    this.visitRoute,
    // this.leadingIcon,
    this.leadingSvg,
    this.actionText = "",
    this.actionIcon = Icons.arrow_forward_ios,
    // Fields required for SettingsEditScreen
    this.subTitle,
    this.inputFieldsList,
  });

  final String title;
  final String? visitRoute;
  final String? leadingSvg;
  final String actionText;
  final IconData actionIcon;

  // Required if not using visitRoute and want to push and edit screen
  // that requires the below variables to display settings form properly
  final String? subTitle;
  final List<String>? inputFieldsList;
}

// Main
List<Setting> settingsMainList = <Setting>[
  Setting(leadingSvg: 'assets/icons/settings/user.svg', title: 'Manage Account', visitRoute: getRouteName(ManageAccountScreen.screenName)),
  Setting(leadingSvg: 'assets/icons/settings/lucide-laptop.svg', title: 'System', visitRoute: getRouteName(SystemScreen.screenName)),
  Setting(leadingSvg: 'assets/icons/settings/credit-card.svg', title: 'Payment', visitRoute: getRouteName(ComingSoonScreen.screenName)),
  Setting(leadingSvg: 'assets/icons/settings/globe.svg', title: 'Language', visitRoute: getRouteName(LanguageScreen.screenName), actionText: "English"),
  Setting(leadingSvg: 'assets/icons/settings/switch-connection.svg', title: 'Smtp', visitRoute: getRouteName(SmtpScreen.screenName)),
];

// Account
List<Setting> settingsAccountList = <Setting>[
  Setting(leadingSvg: 'assets/icons/settings/logout.svg', title: 'Login', visitRoute: getRouteName(LoginScreen.screenName)),
];

// Manage Account - Tip: doesn't use visitRoute, therefore provides subText and
// inputFieldsList for our SettingsEditScreen (which displays a form)
String getMASubText(String name) => 'Ensure the $name is not the same with the previous $name';
List<Setting> settingsManageAccountList = <Setting>[
  Setting(title: 'Name', actionText: 'Chukwu Daniel Nonso', subTitle: getMASubText('name'), inputFieldsList: ['Name']),
  Setting(title: 'Email', actionText: '00chukwudaniel@gmai.com', subTitle: getMASubText('email'), inputFieldsList: ['Email']),
  Setting(title: 'Phone', actionText: '+234 915 120 7528', subTitle: getMASubText('number'), inputFieldsList: ['Phone Number']),
  Setting(title: 'Address', actionText: 'Army Estate Blk f25', subTitle: getMASubText('address'), inputFieldsList: ['Change Address'],),
  Setting(title: 'Password', actionText: 'Good Password', subTitle: getMASubText('password'), inputFieldsList: ['Old Password', 'New Password', 'Confirm Password'],),
];

// System
List<Setting> settingsSystemList = <Setting>[
  Setting(title: 'General', visitRoute: getRouteName(SystemGeneralScreen.screenName)),
  Setting(title: 'System Logos', visitRoute: getRouteName(SystemLogosScreen.screenName)),
];



