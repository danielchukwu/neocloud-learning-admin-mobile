import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';

/// POPUP
/// This is a screen widget that will be used in showDialog (in other words as a pop up)
/// It displays a search input field and a list of user items that can be selected and unselected
class SelectUsersScreen extends StatefulWidget {
  const SelectUsersScreen({
    super.key,
    required this.users,
    required this.selectedUsers,
    required this.selectionLimit,
    this.press,
  });

  final int selectionLimit;
  final List<UserModel> users;
  final List<UserModel> selectedUsers;
  final Function(List<UserModel>)? press;

  @override
  State<SelectUsersScreen> createState() => _SelectUsersScreenState();
}

class _SelectUsersScreenState extends State<SelectUsersScreen> {
  late List<UserModel> usersToSelectFrom;

  @override
  void initState() {
    usersToSelectFrom = widget.users;
  }

  void addOrRemoveUser(UserModel user) {
    int? userIndex = getUserIndexInSelectedUsers(user);

    if (userIndex != null) {
      // remove user
      setState(() {
        widget.selectedUsers.removeAt(userIndex);
      });
    } else {
      if (selectionLimitExceeded()) return;
      // add user
      setState(() {
        widget.selectedUsers.add(user);
      });
    }
    if (widget.press != null) widget.press!(widget.selectedUsers);
  }

  bool selectionLimitExceeded() {
    return widget.selectedUsers.length >= widget.selectionLimit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Column(
          children: [
            // Row - Title and Cancel Icon
            const FormHeader(),

            const HorizontalRule(),

            // Column - Search and Selected Users Count
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Search
                  buildSearchTextField(
                    press: (value) => {},
                    onChangePress: (value) {
                      setState(() {
                        usersToSelectFrom = widget.users
                            .where((user) => user.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    }, controller: TextEditingController(),
                  ),

                  // Selected Count
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppsTextRich(
                        text1: '${widget.selectedUsers.length}',
                        text2: ' Selected',
                        text1Color: kBlack70,
                        text1FontWeight: FontWeight.w600,
                        text1FontSize: 14,
                        text2Color: Colors.black54,
                        text2FontWeight: FontWeight.w500,
                        text2FontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Column - Users List
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: screenPadding,
                  decoration: const BoxDecoration(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          usersToSelectFrom.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: UserSelectionTile(
                                  user: usersToSelectFrom[index],
                                  isSelected:
                                      userIsSelected(usersToSelectFrom[index]),
                                  disableSelection:
                                      selectionLimitExceeded() ? true : false,
                                  press: addOrRemoveUser,
                                ),
                              )).toList()),
                ),
              ),
            ),

            const HorizontalRule(),

            FormFooter(
              title: 'Done',
              formKey: GlobalKey<FormState>(),
              press: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }

  int? getUserIndexInSelectedUsers(UserModel user) {
    for (var i = 0; i < widget.selectedUsers.length; i++) {
      UserModel userr = widget.selectedUsers[i];
      if (userr.id == user.id) {
        return i;
      }
    }
    return null;
  }

  bool userIsSelected(UserModel user) {
    for (var u in widget.selectedUsers) {
      if (u.id == user.id) {
        return true;
      }
    }
    return false;
  }
}
