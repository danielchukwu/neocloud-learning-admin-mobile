import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class DisplayAssetImage extends StatelessWidget {
  final String icon;
  final double size;

  const DisplayAssetImage({
    super.key,
    required this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(icon),
      fit: BoxFit.cover,
      width: size,
    );
  }
}

class RoundBoxAvatar extends StatelessWidget {
  const RoundBoxAvatar({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    this.borderSize = 0,
  });

  final double width;
  final double height;
  final String image;
  final double borderSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: defaultSize * .75),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        border: Border.all(color: kWhite, width: defaultSize * borderSize),
        shape: BoxShape.circle,
        color: kBlack.withOpacity(.05),
      ),
    );
  }
}

class RoundBoxIcon extends StatelessWidget {
  const RoundBoxIcon({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    this.borderSize = 0,
  });

  final double width;
  final double height;
  final double borderSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: defaultSize * .75),
      decoration: BoxDecoration(
        border: Border.all(color: kWhite, width: defaultSize * borderSize),
        shape: BoxShape.circle,
        color: kBlack.withOpacity(.05),
      ),
      child: Icon(icon, color: kBlack50),
    );
  }
}