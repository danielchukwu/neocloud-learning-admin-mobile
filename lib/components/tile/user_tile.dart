import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.title,
    required this.avatar,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final String avatar;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          defaultSize * 2, 0, defaultSize * 2, defaultSize * 2),
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          // Avatar
          CircleAvatar(
              backgroundImage: AssetImage(avatar), radius: defaultSize * 3.5),
          SizedBox(width: defaultSize * 2),
          // Name and Role
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMedium(
                  title: title, weight: FontWeight.w600, color: kBlack90),
              TextMedium(
                  title: subtitle, weight: FontWeight.w500, color: kBlack50),
            ],
          ),

          const Spacer(),

          trailing != null ? trailing! : const SizedBox(),
        ],
      ),
    );
  }
}
