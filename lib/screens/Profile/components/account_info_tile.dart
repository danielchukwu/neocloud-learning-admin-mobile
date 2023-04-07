import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/AccountInfo.dart';
import 'package:neocloud_mobile/size_config.dart';

class AccountInfoTile extends StatelessWidget {
  const AccountInfoTile({Key? key, required this.data}) : super(key: key);
  final AccountInfo data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: defaultSize),
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        horizontalTitleGap: 0,
        dense: true,
        leading: Icon(data.icon, color: kBlack.withOpacity(.4)),
        title: TextMedium(title: data.title, color: kBlack50),
        trailing: SizedBox(
            width: SizeConfig.screenWidth! / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextCustomMaxLine(
                  fontSize: defaultSize * 1.6,
                  maxLines: 1,
                  title: data.info,
                  color: kBlack80,
                )
              ],
            )),
      ),
    ]);
  }
}