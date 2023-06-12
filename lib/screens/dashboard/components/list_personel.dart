import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/stacks.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

// Lists Personel Tiles
class ListPersonel extends StatefulWidget {
  const ListPersonel({
    super.key,
    required this.users,
  });
  final List<Account> users;

  @override
  State<ListPersonel> createState() => _ListPersonelState();
}

class _ListPersonelState extends State<ListPersonel> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: widget.users.length > 0 
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(
              widget.users.length > 3 && !showMore ? 3 : widget.users.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: defaultSize * 2),
                child: PersonelTile(
                  user: widget.users[index],
                ),
              ),
            ) +
            // See More
            (widget.users.length > 3
                ? <Widget>[
                    SizedBox(height: defaultSize * 1),
                    TextLink(
                      title: !showMore ? "See more" : "See less",
                      color: kBlue,
                      fontSize: defaultSize * 1.6,
                      weight: FontWeight.w600,
                      press: (_) => setState(() => showMore = !showMore),
                    ),
                  ]
                : []),
      )
      // 0 personels
      : Container(
        width: SizeConfig.screenWidth! - defaultSize * 4,
        height: defaultSize * 25,
        child: Center(
          child: TextExtraLarge(title: "0 Accounts Found", weight: FontWeight.w400, color: kBlack50,)
        ),
      ),
    );
  }
}

// This tile basically displays a profile image, name,
// whether the person is live or not and time of class
class PersonelTile extends StatelessWidget {
  const PersonelTile({super.key, required this.user});

  final Account user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Images
        StackedImageAndDot(img: user.avatar, text: "2"),
        // Users name and Live - Time
        SizedBox(width: defaultSize * 1.5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text (Name)
            // TextRoleIcon(
            //   svg: getRoleSvgFileName(roleList: user.role),
            //   title: user.fullName,
            //   weight: FontWeight.w600,
            //   fontSize: defaultSize * 1.6,
            // ),
            IconText(
              title: user.fullName,
              color: kBlack80,
              fontWeight: FontWeight.w600,
              fontSize: defaultSize * 1.6,
              iconIsLeft: false,
              svg: getRoleSvgFileName(roleList: user.role),
              iconSize: 16,
            ),

            // Text (Live - Time)
            AppsTextRich(
              text1: "Live",
              text2: "  10:00-1:30",
              text1FontSize: defaultSize * 1.4,
              text2FontSize: defaultSize * 1.4,
              text1Color: kBlue,
              text2Color: kBlack50,
              text1FontWeight: FontWeight.w700,
            ),
          ],
        )
      ],
    );
  }
}
