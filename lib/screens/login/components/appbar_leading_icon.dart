import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class LoginAppBarBackButton extends StatelessWidget {
  const LoginAppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultSize),
      child: IconButton(
        splashRadius: defaultSize * 2.8,
        icon: Icon(
          Icons.arrow_back_ios,
          color: kBlack70,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
