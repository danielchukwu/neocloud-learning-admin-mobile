import 'package:flutter/material.dart';
import 'package:neocloud_mobile/models/Settings.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_tile.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    super.key,
    required this.list,
    this.actionTextBoxWidth,
  });

  // This contains Settings Instances which posses all the settings item data
  // e.g title, leadingSvg, actionText e.t.c
  final List<Setting> list;
  // This is used to set the text box size in width of the action text
  final double? actionTextBoxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        list.length,
        (index) => SettingsTileButton(
          title: list[index].title,
          leadingSvg: list[index].leadingSvg,
          visitRoute: list[index].visitRoute,
          actionText: list[index].actionText,
          actionIcon: list[index].actionIcon,
          actionTextBoxWidth: actionTextBoxWidth,
          // Attributes are used when we want to Edit using Settings Edit Screen
          subTitle: list[index].subTitle,
          inputFieldsList: list[index].inputFieldsList,
        ),
      ),
    );
  }
}
