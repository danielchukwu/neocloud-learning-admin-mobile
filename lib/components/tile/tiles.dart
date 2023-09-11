import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/stacks.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/class/class_screen.dart';
import 'package:neocloud_mobile/utils/utils.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.trailing,
  });

  final UserModel user;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: defaultSize * 2),
      child: Row(
        children: <Widget>[
          // Avatar
          CircleAvatar(
              backgroundImage: AssetImage(user.avatar ?? 'img'), radius: defaultSize * 2.8),
          // StackedImageAndDot(img: avatar, text: "1"),
          SizedBox(width: defaultSize * 2),
          // Name and Role
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMedium(
                  title: user.name, weight: FontWeight.w600, color: kBlack90),
              TextMedium(
                  title: user.role!.name, weight: FontWeight.w500, color: kBlack50),
            ],
          ),

          const Spacer(),

          // trailing != null ? trailing! : const SizedBox(),
        ],
      ),
    );
  }
}

class ClassTile extends StatelessWidget {
  const ClassTile({
    super.key,
    required this.clas,
  });

  final ClassModel clas;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClassScreen(clas: clas),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Class Avatar
          Image.asset(
            clas.avatar ?? '',
            width: defaultSize * 9,
          ),

          // Class Info
          SizedBox(width: defaultSize * 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TextCustomMaxLine(
                  title: clas.name,
                  weight: FontWeight.w600,
                  color: kBlack90,
                  fontSize: defaultSize * 1.8,
                  maxLines: 2,
                ),

                // Avatar and Name
                SizedBox(height: defaultSize * .5),
                buildAvatarAndName(
                  avatar: clas.educators != null && clas.educators!.length > 0 
                    ? clas.educators![0].avatar ?? '' : '',
                  name: clas.educators != null && clas.educators!.length > 0 
                    ? clas.educators![0].name : 'daniel',
                  imgSize: defaultSize * 2.5,
                  fontSize: defaultSize * 1.6,
                  weight: FontWeight.w600,
                ),

                // Time of next class
                SizedBox(height: defaultSize * .5),
                IconText(
                  title: '10:30 - 12:30',
                  icon: Icons.watch_later_rounded,
                  fontSize: defaultSize * 1.4,
                  iconSize: defaultSize * 1.6,
                  iconColor: kBlack70,
                ),

                SizedBox(height: defaultSize * 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// This tile basically displays a profile image, name,
// whether the person is live or not and time of class
class UserActivityTile extends StatelessWidget {
  const UserActivityTile({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(user: user),
        ),
      ),
      child: Row(
        children: <Widget>[
          // Images
          StackedImageAndDot(img: user.avatar!, text: "2"),
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
                title: user.name,
                color: kBlack80,
                fontWeight: FontWeight.w600,
                fontSize: defaultSize * 1.6,
                iconIsLeft: false,
                svg: getRoleSvgFileName(role: user.role?.name),
                iconSize: 16,
              ),

              // Text (Live - Time)
              AppsTextRich(
                text1: "Live",
                text2: "10:00-1:30",
                text1FontSize: defaultSize * 1.4,
                text2FontSize: defaultSize * 1.4,
                text1Color: kBlue,
                text2Color: kBlack50,
                text1FontWeight: FontWeight.w700,
              ),
            ],
          )
        ],
      ),
    );
  }
}


/// This user tile allows for users to select them or not and if one is selected it gets a 
/// blue background style and if not it gets no background styles. it also calls a function
class UserSelectionTile extends StatefulWidget {
  const UserSelectionTile({
    super.key,
    required this.user,
    required this.press,
    this.isSelected = true,
    this.disableSelection = false,
  });
  
  final UserModel user;
  final void Function(UserModel user) press;
  final bool disableSelection;
  final bool isSelected;

  @override
  State<UserSelectionTile> createState() => _UserSelectionTileState();
}

class _UserSelectionTileState extends State<UserSelectionTile> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    print('isSelected: ${isSelected}');
    return GestureDetector(
      onTap: () => setState(() {
        // only select if 
        if (widget.disableSelection == false || isSelected == true) {
          isSelected = !isSelected;
          widget.press(widget.user);
        }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration:  isSelected 
          ? BoxDecoration(
            color: kBlueLight.withOpacity(.12),
            border: Border.all(width: 2, color: kBlueLight),
            borderRadius: const BorderRadius.all(Radius.circular(10))) 
          : BoxDecoration(
          border: Border.all(width: 2, color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Section - left
            Row(
              children: [
                // Avatar
                RoundBoxAvatar(size: 40, image: widget.user.avatar),

                // Column - Name, Role 
                SizedBox(width: defaultSize * 1.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextMedium(title: widget.user.name, weight: FontWeight.w600, color: kBlack80),
                    const TextSmall(title: '{widget.user.role.name}', color: Colors.black54)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


/// This faculty tile allows for users to select them or not and if one is selected it gets a 
/// blue background style and if not it gets no background styles. it also calls a function
class FacultySelectionTile extends StatefulWidget {
  const FacultySelectionTile({
    super.key,
    required this.faculty,
    required this.press,
    this.isSelected = true,
    this.disableSelection = false,
  });
  
  final FacultyModel faculty;
  final void Function(FacultyModel faculty) press;
  final bool disableSelection;
  final bool isSelected;

  @override
  State<FacultySelectionTile> createState() => _FacultySelectionTileState();
}

class _FacultySelectionTileState extends State<FacultySelectionTile> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        // only select if 
        if (widget.disableSelection == false || isSelected == true) {
          isSelected = !isSelected;
          widget.press(widget.faculty);
        }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration:  isSelected 
          ? BoxDecoration(
            color: kBlueLight.withOpacity(.12),
            border: Border.all(width: 2, color: kBlueLight),
            borderRadius: const BorderRadius.all(Radius.circular(10))) 
          : BoxDecoration(
          border: Border.all(width: 2, color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Column - Title and subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextMedium(title: widget.faculty.name, weight: FontWeight.w600, color: kBlack80),
                const TextSmall(title: '{widget.faculty.hod.name} (HOD)', color: Colors.black54)
              ],
            )
          ],
        ),
      ),
    );
  }
}




