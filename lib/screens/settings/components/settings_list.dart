import 'package:flutter/material.dart';
import 'package:neocloud_mobile/models/Settings.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_tile.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    super.key,
    required this.list,
    this.actionTextBoxWidth,
  });

  final List<Setting> list;
  final double? actionTextBoxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        list.length,
            (index) =>
            SettingsTile(
              title: list[index].title,
              leadingSvg: list[index].leadingSvg,
              visitRoute: list[index].visitRoute,
              actionText: list[index].actionText,
              actionIcon: list[index].actionIcon,
              actionTextBoxWidth: actionTextBoxWidth,
            ),
      ),
    );
  }
}