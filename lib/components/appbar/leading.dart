import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

// This is the back button for the AppBar of our position (<)
class LeadingBackButton extends StatelessWidget {
  // final Color backgroundColor;
  final bool isDark;

  const LeadingBackButton({
    super.key,
    this.isDark = false,
    // this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: kWhite,
            padding: const EdgeInsets.fromLTRB(20, 20, 15, 20),
            child: Icon(
              Icons.arrow_back_ios,
              color: isDark ? kBlack80 : kWhite,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
