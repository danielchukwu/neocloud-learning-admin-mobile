import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

/// This should display a button that allows us select a single user
/// It shows a button and then when a user is selected it displays the users avatar and name
class FormSelectUser extends StatelessWidget {
  const FormSelectUser({
    super.key,
    this.buttonText = 'User',
    required this.selectedUsersList,
    required this.usersToSelectFrom,
    required this.updateSelectedUser,
  });

  final String buttonText;
  final List<UserModel>selectedUsersList;
  final List<UserModel>usersToSelectFrom;
  final Function(List<UserModel>) updateSelectedUser;

  showSelectUsersPopup() {
    showSelectUsersDialog(
      usersToSelectFrom: usersToSelectFrom,
      selectedUsers: selectedUsersList,
      selectionLimit: 1,
      press: updateSelectedUser
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Button
        IconTextButton(
          buttonText, 
          backgroundColor: kRed.withOpacity(.1), 
          borderColor: kRed.withOpacity(.7), 
          press: showSelectUsersPopup,
        ),

        // Selected User Avatar
        const SizedBox(width: 15),
        RoundBoxAvatar(size: 35, image: selectedUsersList.isNotEmpty ? selectedUsersList[0].avatar : defaultSlugAvatar),
        
        // Selected User Name
        const SizedBox(width: 10 ),
        TextMedium(title: selectedUsersList.isNotEmpty ? selectedUsersList[0].name : 'John Doe ...', color: Colors.black54,)
      ],
    );
  }
}