import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
// import 'package:neocloud_mobile/components/images.dart';
// import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/dashboard/components/list_user_activity_tile.dart';
import 'package:neocloud_mobile/screens/dashboard/components/personel_navbar.dart';
import 'package:neocloud_mobile/size_config.dart';

class FacultyDashboard extends StatefulWidget {
  const FacultyDashboard({
    super.key,
  });

  @override
  State<FacultyDashboard> createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
  int selectedNavIndex = 0;
  List<String> navItems = ["Classe", "Educator", "Student"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Navbar - Admins  Educators  Hods  Students
            PersonelNavBar(
              navItems: navItems,
              selectedIndex: selectedNavIndex,
              press: (index) => setState(() {
                selectedNavIndex = index;
              }),
            ),

            // Personel List - Display based on selectedNavBarItem
            SizedBox(height: defaultSize * 2),
            Container(
              constraints: BoxConstraints(minHeight: defaultSize * 44),
              padding: screenPadding,
              decoration: BoxDecoration(border: Border(bottom: appsBorder)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  selectedNavIndex == 0
                      ? ListClassTiles(
                          classList: classesList,
                        )
                      : const SizedBox(),
                  // Educators - 1
                  selectedNavIndex == 1
                      ? ListUserActivityTile(
                          users: getFilteredUsersList(1), maxContentCount: 5)
                      : const SizedBox(),
                  // Students - 2
                  selectedNavIndex == 2
                      ? ListUserActivityTile(
                          users: getFilteredUsersList(2), maxContentCount: 5)
                      : const SizedBox(),

                  SizedBox(height: defaultSize * 2)
                ],
              ),
            ),

            SizedBox(height: defaultSize * 2)
          ],
        )
      ],
    );
  }

  getFilteredUsersList(int i) {
    return users.where((element) {
      return element.role.contains(navItems[i]);
    }).toList();
  }
}

class ListClassTiles extends StatefulWidget {
  const ListClassTiles({
    super.key,
    required this.classList,
    this.maxContentCount = 3,
  });

  final List<Class> classList;
  final int maxContentCount;

  @override
  State<ListClassTiles> createState() => _ListClassTilesState();
}

class _ListClassTilesState extends State<ListClassTiles> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return widget.classList.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                  widget.classList.length > widget.maxContentCount && !showMore
                      ? widget.maxContentCount
                      : widget.classList.length,
                  (index) => ClassTile(clas: widget.classList[index]),
                ) +
                // See More
                (widget.classList.length > widget.maxContentCount
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
        : SizedBox(
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
