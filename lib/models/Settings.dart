import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/screens/login/login_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/language_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/manage_account_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/payment_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/smtp_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/system_screen.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class Setting {
  Setting({
    required this.title,
    required this.visitRoute,
    // this.leadingIcon,
    this.leadingSvg,
    this.actionText = "",
    this.actionIcon = Icons.arrow_forward_ios,
  });

  final String title;
  final String visitRoute;
  // final String? leadingIcon;
  final String? leadingSvg;
  final String actionText;
  final IconData actionIcon;
}

// General
List<Setting> settingsGeneralList = <Setting>[
  Setting(leadingSvg: 'assets/icons/settings/user.svg', title: 'Manage Account', visitRoute: getRouteName(ManageAccountScreen.screenName)),
  Setting(leadingSvg: 'assets/icons/settings/lucide-laptop.svg', title: 'System', visitRoute: getRouteName(SystemScreen.screenName)),
  Setting(leadingSvg: 'assets/icons/settings/credit-card.svg', title: 'Payment', visitRoute: getRouteName(PaymentScreen.screenName)),
  Setting(leadingSvg: 'assets/icons/settings/globe.svg', title: 'Language', visitRoute: getRouteName(LanguageScreen.screenName), actionText: "English"),
  Setting(leadingSvg: 'assets/icons/settings/switch-connection.svg', title: 'Smtp', visitRoute: getRouteName(SmtpScreen.screenName)),
];

// Account
List<Setting> settingsAccountList = <Setting>[
  Setting(leadingSvg: 'assets/icons/settings/logout.svg', title: 'Login', visitRoute: getRouteName(LoginScreen.screenName)),
];

// Manage Account
List<Setting> settingsManageAccountList = <Setting>[
  Setting(title: 'Name', actionText: 'Chukwu Daniel Nonso', visitRoute: getRouteName(SettingsScreen.screenName)),
  Setting(title: 'Email', actionText: '00chukwudaniel@gmail.com', visitRoute: getRouteName(SettingsScreen.screenName)),
  Setting(title: 'Phone', actionText: '+234 915 120 7528', visitRoute: getRouteName(SettingsScreen.screenName)),
  Setting(title: 'Address', actionText: 'Army Estate Blk f25', visitRoute: getRouteName(SettingsScreen.screenName)),
  Setting(title: 'Password', actionText: 'Good Password', visitRoute: getRouteName(SettingsScreen.screenName)),
];

// System
List<Setting> settingsSystemList = <Setting>[
  Setting(title: 'General', visitRoute: getRouteName(SettingsScreen.screenName)),
  Setting(title: 'System Logos', visitRoute: getRouteName(SettingsScreen.screenName)),
];



