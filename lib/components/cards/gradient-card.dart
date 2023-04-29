import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({
    super.key,
    required this.contentWidget,
  });

  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: defaultSize * 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kBlue,
            kBlueLight
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(defaultSize * 2),
      ),
      child: Center(
        child: contentWidget,
      ),
    );
  }
}
