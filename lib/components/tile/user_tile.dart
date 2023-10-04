import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';
import 'package:skeletons/skeletons.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.trailing,
  });

  final UserEntity user;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(0, 52, 51, 51),
      color: Theme.of(context).canvasColor.withOpacity(.4),
      padding: EdgeInsets.only(bottom: defaultSize * 2),
      child: Row(
        children: <Widget>[
          // Avatar
          CircleAvatar(
              backgroundImage: AssetImage(user.avatar ?? 'img'),
              radius: defaultSize * 2.8),
          // StackedImageAndDot(img: avatar, text: "1"),
          SizedBox(width: defaultSize * 2),
          // Name and Role
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name!,
                style: TextStyle(
                    color: Theme.of(context).canvasColor.withOpacity(.8),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                user.role != null ? user.role!.name : 'unassigned',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).canvasColor.withOpacity(.5),
                ),
              ),
            ],
          ),

          const Spacer(),

          // trailing != null ? trailing! : const SizedBox(),
        ],
      ),
    );
  }
}

class UserTileSkeleton extends StatelessWidget {
  const UserTileSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: Row(
      children: [
        // Avatar
        const SkeletonAvatar(
          style: SkeletonAvatarStyle(
            height: 56,
            width: 56,
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
        ),

        // Column (name, role)
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 170, child: _buildParagraph()),
              SizedBox(width: 100, child: _buildParagraph()),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildParagraph() {
    return const SkeletonLine(
      style: SkeletonLineStyle(
        height: 14,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 5),
      ),
    );
  }
}
