import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class StackCoverAndProfileImage extends StatelessWidget {
  const StackCoverAndProfileImage({
    super.key,
    required this.cover,
    required this.avatar,
    required this.containerSize,
    required this.roleSvg,
    this.coverSize = 280,
    this.profileImgBorderSize = 3,
    this.coverOverlay = Colors.grey,
    this.profileImageVerticalPosition = 68,
  });

  final String cover;
  final String avatar;
  final String roleSvg;
  final double containerSize;
  final double coverSize;
  final double profileImgBorderSize;
  final Color coverOverlay;
  final double profileImageVerticalPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: kOrange,
      height: containerSize,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // cover image and cover overlay
          buildCoverImage(context),

          // profile image in circular format
          buildProfileImage(),

          // users role icon
          buildUserRoleIcon()
        ],
      ),
    );
  }

  Positioned buildUserRoleIcon() {
    return Positioned(
      right: 20,
      bottom: 6,
      child: SvgPicture.asset(roleSvg, width: 22),
    );
  }

  Positioned buildProfileImage() {
    return Positioned(
      height: 110,
      width: 110,
      top: profileImageVerticalPosition,
      // left: 0,
      // right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: kBlue,
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
      top: -20,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(cover), fit: BoxFit.cover),
        ),
        child: Container(color: coverOverlay), // dark overlay
      ),
    );
  }
}
