import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/size_config.dart';

// Lists Personel Tiles
class ListUserActivityTile extends StatefulWidget {
  const ListUserActivityTile({
    super.key,
    required this.users,
    this.maxContentCount = 3,
  });
  final List<UserModel> users;
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
                    padding: const EdgeInsets.only(bottom: 20),
                    child: UserActivityTile(
                      user: widget.users[index],
                    ),
                  ),
                ) +
                // See More
                (widget.users.length > widget.maxContentCount
                    ? <Widget>[
                        // SizedBox(height: 10),
                        TextLink(
                          title: !showMore ? "See more" : "See less",
                          color: kBlue,
                          fontSize: 16,
                          weight: FontWeight.w600,
                          press: (_) => setState(() => showMore = !showMore),
                        ),
                      ]
                    : []),
          )
        // 0 personels
        : Container(
            width: SizeConfig.screenWidth! - 40,
            height: 250,
            child: Center(
                child: TextExtraLarge(
              title: "0 Accounts Found",
              weight: FontWeight.w400,
              color: kBlack50,
            )),
          );
  }
}
