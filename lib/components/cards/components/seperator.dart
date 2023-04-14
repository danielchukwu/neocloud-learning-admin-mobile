import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class Seperator extends StatelessWidget {
  const Seperator({Key? key, this.height = 40}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: defaultSize * .2,
      color: kBlack50,
    );
  }
}