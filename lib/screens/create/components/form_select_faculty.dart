import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/constants/constants.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/screens/create/select_faculty_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

/// This should display a button that allows us select a single faculty
/// It shows a button and then when a faculty is selected it displays the facultys avatar and name
class FormSelectFaculty extends StatelessWidget {
  const FormSelectFaculty({
    super.key,
    this.buttonText = 'Faculty',
    required this.selectedFacultyList,
    required this.facultiesToSelectFrom,
    required this.updateSelectedFaculty,
    this.bgColor,
    this.borderColor,
  });

  final String buttonText;
  final List<FacultyModel> selectedFacultyList;
  final List<FacultyModel> facultiesToSelectFrom;
  final Function(List<FacultyModel>) updateSelectedFaculty;
  final Color? bgColor;
  final Color? borderColor;

  showSelectFacultyPopup() {
    showDialogWrapper(
      widget: SelectFacultyScreen(
        faculties: facultiesToSelectFrom,
        selectedFaculties: selectedFacultyList,
        selectionLimit: 1,
        press: updateSelectedFaculty,
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
          press: showSelectFacultyPopup,
        ),

        // Selected faculty Avatar
        const SizedBox(width: 15),
        const RoundBoxAvatar(size: 35, image: defaultBookStackAvatar),

        // Selected faculty Name
        const SizedBox(width: 10),
        TextMedium(
          title: selectedFacultyList.isNotEmpty
              ? selectedFacultyList[0].name
              : 'Faculty Name ...',
          color: Theme.of(context).canvasColor.withOpacity(.5),
        )
      ],
    );
  }
}
