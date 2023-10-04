import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';

// This is the back button for the AppBar of our position (<)
class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({
    super.key,
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
            color: getColorOpposite(Theme.of(context).canvasColor),
            padding: EdgeInsets.fromLTRB(defaultSize * 2, defaultSize * 2, defaultSize * 1.5, defaultSize * 2),
            child: Icon(
              Icons.arrow_back_ios,
              size: defaultSize * 2.5,
            ),
          ),
        )
      ],
    );
  }
}
