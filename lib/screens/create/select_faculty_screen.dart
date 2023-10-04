import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';

/// POPUP
/// This is a screen widget that will be used in showDialog (in other words as a pop up)
/// It displays a search input field and a list of user items that can be selected and unselected
class SelectFacultyScreen extends StatefulWidget {
  const SelectFacultyScreen({
    super.key,
    required this.faculties,
    required this.selectedFaculties,
    required this.selectionLimit,
    this.press,
  });

  final List<FacultyModel> faculties;
  final List<FacultyModel> selectedFaculties;
  final int selectionLimit;
  final Function(List<FacultyModel>)? press;

  @override
  State<SelectFacultyScreen> createState() => _SelectFacultyScreenState();
}

class _SelectFacultyScreenState extends State<SelectFacultyScreen> {
  late List<FacultyModel> facultiesToSelectFrom;

  @override
  void initState() {
    facultiesToSelectFrom = widget.faculties;
  }

  void addOrRemoveFaculty(FacultyModel user) {
    int? facultyIndex = getfacultyIndexInSelectedUsers(user);

    if (facultyIndex != null) {
      // remove user
      setState(() {
        widget.selectedFaculties.removeAt(facultyIndex);
      });
    } else {
      if (selectionLimitExceeded()) return;
      // add user
      setState(() {
        widget.selectedFaculties.add(user);
      });
    }
    if (widget.press != null) widget.press!(widget.selectedFaculties);
  }

  bool selectionLimitExceeded() {
    return widget.selectedFaculties.length >= widget.selectionLimit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: getColorOpposite(Theme.of(context).canvasColor),
        child: Column(
          children: [
            // Row - Title and Cancel Icon
            const FormHeader(),

            const HorizontalRule(),

            // Column - Search and Selected Faculties Count
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppsTextField(
                    prefixIcon: Icons.search,
                    hintText: "Search",
                    controller: TextEditingController(),
                    onSubmitPress: (_) {},
                    onChangePress: _onSearchChange,
                  ),

                  // Selected Count
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppsTextRich(
                        text1: '${widget.selectedFaculties.length}',
                        text2: ' Selected',
                        text1Color: Theme.of(context).canvasColor.withOpacity(.7),
                        text1FontWeight: FontWeight.w600,
                        text1FontSize: 14,
                        text2Color: Theme.of(context).canvasColor.withOpacity(.5),
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
                          facultiesToSelectFrom.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: FacultySelectionTile(
                                  faculty: facultiesToSelectFrom[index],
                                  isSelected: facultyIsSelected(
                                      facultiesToSelectFrom[index]),
                                  disableSelection:
                                      selectionLimitExceeded() ? true : false,
                                  press: addOrRemoveFaculty,
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

  _onSearchChange(value) {
                    setState(() {
                      facultiesToSelectFrom = widget.faculties
                          .where((fac) => fac.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  }

  int? getfacultyIndexInSelectedUsers(FacultyModel user) {
    for (var i = 0; i < widget.selectedFaculties.length; i++) {
      FacultyModel userr = widget.selectedFaculties[i];
      if (userr.id == user.id) {
        return i;
      }
    }
    return null;
  }

  bool facultyIsSelected(FacultyModel user) {
    for (var u in widget.selectedFaculties) {
      if (u.id == user.id) {
        return true;
      }
    }
    return false;
  }
}
