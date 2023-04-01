import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class Logo extends StatelessWidget {
  final String icon;
  final double size;

  const Logo({
    super.key,
    required this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(icon),
      width: size,
    );
  }
}
