import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/size_config.dart';

// Lists Personel Tiles
class ListUserActivityTile extends StatefulWidget {
  const ListUserActivityTile({
    super.key,
    required this.users,
    this.maxContentCount = 3,
  });
  final List<Account> users;
  final int maxContentCount;

  @override
  State<ListUserActivityTile> createState() => _ListUserActivityTileState();
}

class _ListUserActivityTileState extends State<ListUserActivityTile> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return widget.users.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                  widget.users.length > widget.maxContentCount && !showMore
                      ? widget.maxContentCount
                      : widget.users.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: defaultSize * 2),
                    child: UserActivityTile(
                      user: widget.users[index],
                    ),
                  ),
                ) +
                // See More
                (widget.users.length > widget.maxContentCount
                    ? <Widget>[
                        // SizedBox(height: defaultSize * 1),
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
                child: TextExtraLarge(
              title: "0 Accounts Found",
              weight: FontWeight.w400,
              color: kBlack50,
            )),
          );
  }
}
