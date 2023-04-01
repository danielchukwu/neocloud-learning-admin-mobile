import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: EdgeInsets.only(left: defaultSize),
        child: IconButton(
          splashRadius: defaultSize * 2.8,
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack70,
          ),
          color: kBlack70,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}