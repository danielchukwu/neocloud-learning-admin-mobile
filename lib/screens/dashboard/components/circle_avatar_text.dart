import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class CircleAvatarAndText extends StatelessWidget {
  const CircleAvatarAndText({
    super.key,
    required this.press,
    this.image,
    this.text = '',
    this.width = 60,
    this.height = 60,
  });

  final String? image;
  final String text;
  final double width;
  final double height;
  final Function(BuildContext context) press;

  @override
  Widget build(BuildContext context) {
    String firstName = text.split(' ')[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Avatar
        InkWell(
          onTap: () => press(context),
          child: image != null
              ? RoundBoxAvatar(width: width, height: height, image: image!)
              : RoundBoxIcon(width: width, height: height, icon: Icons.add),
        ),

        // Text - Users First Name
        SizedBox(height: defaultSize * .7),
        TextSmall(title: firstName = text.split(' ')[0], color: kBlack50),
      ],
    );
  }
}
