import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.visitRoute,
    this.leadingIcon,
    this.leadingSvg,
    this.actionText = "",
    this.actionTextBoxWidth,

    this.actionIcon = Icons.arrow_forward_ios,
  });

  final String title;
  final String actionText;
  final String visitRoute;
  final double? actionTextBoxWidth;
  final String? leadingSvg;
  final IconData? leadingIcon;
  final IconData? actionIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToScreen(context: context, routeName: visitRoute),
      child: ListTile(
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
      ),
    );
  }
}
