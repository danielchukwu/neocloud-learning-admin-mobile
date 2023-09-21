import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/create/select_user_screen.dart';

/// This should display a button that allows us select a single user
/// It shows a button and then when a user is selected it displays the users avatar and name
class FormSelectUser extends StatelessWidget {
  const FormSelectUser({
    super.key,
    this.buttonText = 'User',
    required this.selectedUsers,
    required this.usersToSelectFrom,
    required this.updateSelectedUser,
    this.bgColor,
    this.borderColor,
  });

  final String buttonText;
  final List<UserModel> selectedUsers;
  final List<UserModel> usersToSelectFrom;
  final Function(List<UserModel>) updateSelectedUser;
  final Color? bgColor;
  final Color? borderColor;

  showSelectUsersPopup() {
    showDialogWrapper(
      widget: SelectUsersScreen(
        users: usersToSelectFrom,
        selectedUsers: selectedUsers,
        selectionLimit: 1,
        press: updateSelectedUser,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Button
        IconTextButton(
          buttonText,
          backgroundColor: bgColor ?? kRed.withOpacity(.1),
          borderColor: borderColor ?? kRed.withOpacity(.7),
          press: showSelectUsersPopup,
        ),

        // Selected User Avatar
        const SizedBox(width: 15),
        RoundBoxAvatar(
            size: 35,
            image: selectedUsers.isNotEmpty
                ? selectedUsers[0].avatar
                : defaultSlugAvatar),

        // Selected User Name
        const SizedBox(width: 10),
        TextMedium(
            title: selectedUsers.isNotEmpty
                ? selectedUsers[0].name
                : 'John Doe ...',
            color: Colors.black54)
      ],
    );
  }
}
