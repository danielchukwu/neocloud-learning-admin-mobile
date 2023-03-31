import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class Logo extends StatelessWidget {
  Logo({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(icon),
      width: defaultSize * 27,
    );
  }
}
