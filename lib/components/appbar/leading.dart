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
        SizedBox(width: defaultSize * 1.5),
        CircleAvatar(
          backgroundColor: (isDark ? kBlack90 : kWhite).withOpacity(.2),
          child: Padding(
            padding: EdgeInsets.only(left: defaultSize * .5),
            child: IconButton(
              // splashRadius: defaultSize * 2,
              icon: Icon(
                Icons.arrow_back_ios,
                color: isDark ? kBlack90 : kWhite,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
