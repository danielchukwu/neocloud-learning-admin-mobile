import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/stacks.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/utils.dart';

class PersonelDashboard extends StatefulWidget {
  const PersonelDashboard({
    super.key,
  });

  @override
  State<PersonelDashboard> createState() => _PersonelDashboardState();
}

class _PersonelDashboardState extends State<PersonelDashboard> {
  int selectedNavIndex = 0;
  List<String> navItems = ["Admin", "Educator", "Student"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
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

              // Display Content based on selectedNavBarItem
              SizedBox(height: defaultSize * 2),
              // Admins - 0
              selectedNavIndex == 0
                  ? ListPersonel(users: getFilteredUsersList(0))
                  : const SizedBox(),
              // Educators - 1
              selectedNavIndex == 1
                  ? ListPersonel(users: getFilteredUsersList(1))
                  : const SizedBox(),
              // Hods - 2
              selectedNavIndex == 2
                  ? ListPersonel(users: getFilteredUsersList(2))
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }

  getFilteredUsersList(int i) {
    dynamic result = users.where((element) {
      print(element.role + " == " + navItems[i]);
      return element.role.toLowerCase() == navItems[i].toLowerCase();
    }).toList();
    print("filtered result");
    print(users);
    print(result);

    return result;
  }
}

class PersonelNavBar extends StatelessWidget {
  const PersonelNavBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.press,
  });

  final List<String> navItems;
  final int selectedIndex;
  final Function(int num) press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        navItems.length,
        (index) => InkWell(
          onTap: () => press(index),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            child: Column(
              children: <Widget>[
                // Title
                TextLarge(
                  title: navItems[index] + "s",
                  weight: index == selectedIndex
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: index == selectedIndex ? kBlack90 : kBlack50,
                ),
                // Selector
                SizedBox(height: defaultSize),
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                  height: defaultSize * .4,
                  width: defaultSize * 4,
                  color: index == selectedIndex
                      ? kBlack.withOpacity(.2)
                      : Colors.transparent,
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

// Lists Personel Tiles
class ListPersonel extends StatelessWidget {
  const ListPersonel({
    super.key,
    required this.users,
  });
  final List<Account> users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(
          users.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: defaultSize * 2),
            child: PersonelTile(
              user: users[index],
            ),
          ),
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
            // Text (Name)device
            getNameWithRoleIcon(
              role: user.role,
              title: user.fullName,
              weight: FontWeight.w600,
              fontSize: defaultSize * 1.6,
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
