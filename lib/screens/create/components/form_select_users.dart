import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/create/select_user_screen.dart';

/// This widget displays a button that can be used for selecting multiple users
/// When users are selected, the widget then displays the selected users avatars
class FormSelectUsers extends StatefulWidget {
  const FormSelectUsers({
    super.key,
    this.buttonText = 'Users',
    this.avatarText = 'NC',
    this.selectionLimit = 10,
    required this.selectedUsers,
    required this.usersToSelectFrom,
    required this.updateSelectedUsers,
    this.bgColor,
    this.borderColor,
  });

  final String buttonText;
  final String avatarText;
  final int selectionLimit;
  final List<UserModel> selectedUsers;
  final List<UserModel> usersToSelectFrom;
  final Function(List<UserModel>) updateSelectedUsers;
  final Color? bgColor;
  final Color? borderColor;

  @override
  State<FormSelectUsers> createState() => _FormSelectUsersState();
}

class _FormSelectUsersState extends State<FormSelectUsers> {
  late List<UserModel> _selectedUsers;

  @override
  void initState() {
    super.initState();
    _selectedUsers = widget.selectedUsers;
  }

  showSelectUsersPopup() {
    showDialogWrapper(
      widget: SelectUsersScreen(
        users: widget.usersToSelectFrom,
        selectedUsers: _selectedUsers,
        selectionLimit: widget.selectionLimit,
        press: (users) {
          widget.updateSelectedUsers(users);
          setState(() {
            _selectedUsers = users;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: _selectedUsers.isEmpty
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Educators Button
        IconTextButton(
          widget.buttonText,
          backgroundColor: widget.bgColor ?? kBlue.withOpacity(.3),
          borderColor: widget.borderColor ?? kBlue.withOpacity(.8),
          press: showSelectUsersPopup,
        ),

        // Default Avatar Stack or Selected Users Avatar
        const SizedBox(width: 15),
        Expanded(
          child: _selectedUsers.isEmpty
              ? avatarStack(context)
              : showSelectedUsersAvatars(),
        ),
      ],
    );
  }

  Stack avatarStack(BuildContext context) {
    return Stack(
      children: [
        // Avatar - +
        Positioned(
          left: 25,
          child: AvatarInsertWidget(
            // backgroundColor: kBlack50,
            backgroundColor: Theme.of(context).canvasColor.withOpacity(.5),
            widget: Icon(Icons.add,
                color: getColorOpposite(Theme.of(context).canvasColor)),
          ),
        ),

        // Avatar - AB
        AvatarInsertWidget(
          backgroundColor: kBlue,
          widget: TextMedium(
            title: widget.avatarText,
            weight: FontWeight.w600,
            color: getColorOpposite(Theme.of(context).canvasColor),
          ),
        ),
      ],
    );
  }

  Wrap showSelectedUsersAvatars() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        _selectedUsers.length,
        (index) => RoundBoxAvatar(size: 35, image: _selectedUsers[0].avatar),
      ),
    );
  }
}
