import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    required this.size,
    required this.image,
    this.borderSize = 0,
  });

  final double size;
  final String image;
  final double borderSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        border: Border.all(color: kWhite, width: 10 * borderSize),
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
      decoration: BoxDecoration(
        border: Border.all(color: kWhite, width: 10 * borderSize),
        shape: BoxShape.circle,
        color: kBlack.withOpacity(.05),
      ),
      child: Icon(icon, color: kBlack50),
    );
  }
}

class RectangularBoxImage extends StatelessWidget {
  final String img;
  final double height;
  final double borderRadius;

  const RectangularBoxImage({
    Key? key,
    required this.img,
    this.height = 200,
    this.borderRadius = 00,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: kBlack.withOpacity(.2),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class IconOrSvg extends StatelessWidget {
  const IconOrSvg(
      {Key? key,
      this.svg,
      this.icon,
      this.color = Colors.black87,
      this.size = 20})
      : super(key: key);

  final String? svg;
  final IconData? icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (svg != null) {
      return SvgPicture.asset(svg!, width: size, color: color);
    } else {
      return Icon(icon, color: color, size: size);
    }
  }
}


// This widget is basically basically a circle that displays any provided widget in its center 
class AvatarInsertWidget extends StatelessWidget {
  const AvatarInsertWidget({
    super.key,
    required this.widget,
    this.size = 35,
    this.backgroundColor = Colors.blue
  });

  final double size;
  final Widget widget;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size)
      ),
      child: Center(
        child: widget
      ),
    );
  }
}