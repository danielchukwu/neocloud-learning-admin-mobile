import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/settings/components/settings_edit_screen.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

class SettingsTileButton extends StatelessWidget {
  const SettingsTileButton({
    super.key,
    required this.title,
    this.visitRoute,
    this.leadingIcon,
    this.leadingSvg,
    this.actionText = "",
    this.actionTextBoxWidth,
    this.actionIcon = Icons.arrow_forward_ios,
    this.subTitle,
    this.inputFieldsList,
  });

  final String title;
  final String actionText;
  final String? visitRoute;
  final double? actionTextBoxWidth;
  final String? leadingSvg;
  final IconData? leadingIcon;
  final IconData? actionIcon;

  // This fields are required if visitRoute is null - They are field initiators
  // for SettingsEditScreen
  final String? subTitle;
  final List<String>? inputFieldsList;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (visitRoute != null) {
          navigateToScreen(context: context, routeName: visitRoute!);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              SettingsEditScreen(
                  title: title,
                  subTitle: subTitle != null
                      ? subTitle!
                      : "",
                  inputFieldsList: inputFieldsList != null
                      ? inputFieldsList!
                      : []
              ),
          ));
        }
      },
      child: SettingsTile(leadingSvg: leadingSvg, title: title, actionTextBoxWidth: actionTextBoxWidth, actionText: actionText, actionIcon: actionIcon),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.leadingSvg,
    this.actionText = "",
    this.actionTextBoxWidth = 40,
    this.actionIcon = Icons.arrow_forward_ios,
  });

  final String? leadingSvg;
  final String title;
  final double? actionTextBoxWidth;
  final String actionText;
  final IconData? actionIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          leadingSvg != null
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconOrSvg(
              svg: leadingSvg,
              size: defaultSize * 2,
              color: kBlack80,
            ),
          ])
              : const SizedBox(),
          leadingSvg != null ? SizedBox(width: defaultSize * 2,) : SizedBox(),
          TextMedium(title: title, weight: FontWeight.w500),
        ],
      ),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      trailing: Container(
        height: defaultSize * 2,
        width: actionTextBoxWidth == null ? SizeConfig.screenWidth! / 2 : actionTextBoxWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextSmall(
                title: shortenText(text: actionText, limit: 20),
                color: kBlack50),
            SizedBox(width: defaultSize),
            Icon(actionIcon, size: defaultSize * 1.5),
          ],
        ),
      ),
    );
  }
}
