import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class GrantPermission extends StatelessWidget {
  const GrantPermission({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Grant Permission
        SizedBox(height: defaultSize * 3),
        Padding(
          padding: screenPadding,
          child: TextCustom(
            title: "Grant Permission",
            fontSize: defaultSize * 2.2,
            color: kBlack80,
            weight: FontWeight.w600,
          ),
        ),
        SizedBox(height: defaultSize * 2),

        // Thumbs up and Text
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: defaultSize * 4),
            Image(
              image: const AssetImage('assets/icons/thumbs-up.png'),
              width: defaultSize * 5,
            ),
            SizedBox(width: defaultSize * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextMedium(
                    title: 'Grant Permission for Students or Educators to be able to take certain courses at NCT',
                    color: kBlack60,
                  ),
                  SizedBox(height: defaultSize * 2),
                  AppsButton(
                    title: 'Grant',
                    press: (context) => navigateToComingSoon(context: context),
                    bgColor: kBlue,
                    padTopBottom: defaultSize * .5,
                    borderRadius: defaultSize * 4,
                  ),
                ],
              ),
            ),
            SizedBox(width: defaultSize * 4),
          ],
        ),
        SizedBox(height: defaultSize * 5,)
      ],
    );
  }
}
