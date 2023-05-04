import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

class StackCoverAndProfileImage extends StatelessWidget {
  const StackCoverAndProfileImage({
    super.key,
    required this.cover,
    required this.avatar,
    this.coverSize = 280,
    this.profileImgBorderSize = 3,
    this.coverOverlay = Colors.green,
    this.profileImageVerticalPosition = 68,
    this.bgCurveVerticalPosition = 130,
  });

  final String cover;
  final String avatar;
  final double coverSize;
  final double profileImgBorderSize;
  final Color coverOverlay;
  final double profileImageVerticalPosition;
  final double bgCurveVerticalPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: coverSize,
      child: Stack(
        children: <Widget>[
          // cover image and cover overlay
          buildCoverImage(context),

          // a rectangle with circular border radius of 20
          buildBoxBackgroundWithCurvedEdges(context),

          // profile image in circular format
          buildProfileImage()
        ],
      ),
    );
  }

  Positioned buildBoxBackgroundWithCurvedEdges(BuildContext context) {
    return Positioned(
          height: defaultSize * 5,
          width: MediaQuery.of(context).size.width,
          top: bgCurveVerticalPosition,
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              // borderRadius: BorderRadius.circular(defaultSize * 2),
            ),
          ),
        );
  }

  Positioned buildProfileImage() {
    return Positioned(
          height: defaultSize * 11,
          width: defaultSize * 11,
          top: profileImageVerticalPosition,
          left: defaultSize * 2,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kWhite, width: profileImgBorderSize),
              image: DecorationImage(
                image: AssetImage(avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
  }

  Positioned buildCoverImage(BuildContext context) {
    return Positioned(
          height: coverSize,
          width: MediaQuery.of(context).size.width,
          top: defaultSize * -2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(cover), fit: BoxFit.cover),
            ),
            child: Container(color: coverOverlay), // dark overlay
          ),
        );
  }
}
