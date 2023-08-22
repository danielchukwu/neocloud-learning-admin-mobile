import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';

/// This should display a button that allows us select a single faculty
/// It shows a button and then when a faculty is selected it displays the facultys avatar and name
class FormSelectFaculty extends StatelessWidget {
  const FormSelectFaculty({
    super.key,
    this.buttonText = 'Faculty',
    required this.selectedFacultyList,
    required this.facultiesToSelectFrom,
    required this.updateSelectedFaculty,
  });

  final String buttonText;
  final List<FacultyModel>selectedFacultyList;
  final List<FacultyModel>facultiesToSelectFrom;
  final Function(List<FacultyModel>) updateSelectedFaculty;

  showSelectFacultyPopup() {
    showSelectFacultyDialog(
      facultyToSelectFrom: facultiesToSelectFrom,
      selectedFaculties: selectedFacultyList,
      selectionLimit: 1,
      press: updateSelectedFaculty
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
          press: showSelectFacultyPopup,
        ),

        // Selected faculty Avatar
        SizedBox(width: defaultSize * 1.5),
        const RoundBoxAvatar(size: 35, image: defaultBookStackAvatar),
        
        // Selected faculty Name
        SizedBox(width: defaultSize * 1 ),
        TextMedium(title: selectedFacultyList.isNotEmpty ? selectedFacultyList[0].name : 'Faculty Name ...', color: Colors.black54,)
      ],
    );
  }
}