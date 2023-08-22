import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

/// This widget displays a button that can be used for selecting multiple users
/// When users are selected, the widget then displays the selected users avatars 
class FormSelectUsers extends StatelessWidget {
  const FormSelectUsers(
    {
      super.key,
      this.buttonText = 'Users',
      this.avatarText = 'NC',
      this.selectionLimit = 10,
      required this.selectedUsersList,
      required this.usersToSelectFrom,
      required this.updateSelectedUsers,
    });

  final String buttonText;
  final String avatarText;
  final int selectionLimit;
  final List<UserModel> selectedUsersList;
  final List<UserModel> usersToSelectFrom;
  final Function(List<UserModel>) updateSelectedUsers;

  showSelectUsersPopup() {
    showSelectUsersDialog(
      usersToSelectFrom: usersToSelectFrom,
      selectedUsers: selectedUsersList,
      selectionLimit: selectionLimit,
      press: updateSelectedUsers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: selectedUsersList.isEmpty
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        
        // Educators Button
        IconTextButton(
          buttonText,
          backgroundColor: kBlue.withOpacity(.3),
          borderColor: kBlue.withOpacity(.8),
          press: showSelectUsersPopup,
        ),

        // Default Avatar Stack or Selected Users Avatar
        SizedBox(width: defaultSize * 1.5),
        Expanded(
          child: selectedUsersList.isEmpty
              ? avatarStack()
              : showSelectedUsersAvatars(),
        ),
      ],
    );
  }

  Stack avatarStack() {
    return Stack(
      children: [
        // Avatar - +
        Positioned(
          left: 25,
          child: AvatarInsertWidget(
            backgroundColor: kBlack50,
            widget: const Icon(Icons.add, color: Colors.white),
          ),
        ),

        // Avatar - AB
        AvatarInsertWidget(
          backgroundColor: kBlue,
          widget: TextMedium(title: avatarText, weight: FontWeight.w600,color: Colors.white),
        ),
      ],
    );
  }

  Wrap showSelectedUsersAvatars() {
    return Wrap(
      spacing: defaultSize,
      runSpacing: defaultSize,
      children: List.generate(
        selectedUsersList.length,
        (index) => RoundBoxAvatar(size: 35, image: selectedUsersList[0].avatar),
      ),
    );
  }
}
