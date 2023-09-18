import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/create/components/form_add_cover.dart';
import 'package:neocloud_mobile/screens/create/components/form_modules.dart';
import 'package:neocloud_mobile/screens/create/components/form_select_faculty.dart';
import 'package:neocloud_mobile/screens/create/controllers/create_class_controller.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import 'components/form_footer.dart';
import 'components/form_header.dart';
import 'components/form_select_users.dart';

/// POPUP
/// This Screen is used in a showDialog, so it will basically not have
/// its own screen per say but will be used in a pop up environment instead
class CreateClassInstanceScreen extends StatelessWidget {
  CreateClassInstanceScreen({super.key});

  static String screenName = 'create class instance';
  var c = Get.put(ClassGetXController());

  @override
  Widget build(BuildContext context) {
    c.reset();
    c.enableSetDateAndTime = true.obs;
    c.enableAutomateDateTime = true.obs;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header (Title, Cancel Icon)
            const FormHeader(title: ''),

            // Form Body
            Expanded(
                child: SingleChildScrollView(
              controller: c.scrollController.value,
              child: Padding(
                padding: screenPadding,
                child: buildForm(),
              ),
            )),

            const HorizontalRule(),
            FormFooter(
                formKey: c.formKey.value,
                btnIsLoading: c.isSubmittingForm.value,
                press: () async {
                  c.isSubmittingForm = true.obs;
                  // submit form if form data is valid
                  if (c.createClassFormDataIsValid()) {
                    // submit form
                    await c.submitCreateClassForm();
                  }
                  c.isSubmittingForm = false.obs;
                }),
          ],
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
        key: c.formKey.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),

            // Class Avatar / Cover
            FormAddCover(
              press: (file) {
                c.coverImgFile = file.obs;
              },
            ),
            if (c.coverImgFileHasError.value == true)
              const TextInputError(text: 'A class requires an image cover'),

            // Class Name
            const SizedBox(height: 30),
            FormInputField(
              controller: c.titleController.value,
              hintText: 'Class Name',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              validator: validateRequireField,
              press: (_) {},
            ),
            if (c.hodHasError.value == true) const TextInputError(),

            // Add Faculty
            const SizedBox(height: 15),
            FormSelectFaculty(
              buttonText: 'Faculty',
              facultiesToSelectFrom: c.facultiesToSelectFrom.value,
              selectedFacultyList: c.selectedFaculties.value,
              updateSelectedFaculty: c.updateSelectedFaculty,
            ),

            if (c.hodHasError.value == true) const TextInputError(),

            const SizedBox(height: 15),

            const HorizontalRule(),

            // Add Educators
            const SizedBox(height: 15),
            FormSelectUsers(
              buttonText: 'Educators',
              avatarText: 'ED',
              selectedUsers: c.selectedEducatorsList,
              usersToSelectFrom: c.usersToSelectFrom,
              updateSelectedUsers: c.updateSelectedEducators,
            ),
            if (c.educatorsListHasError.value == true) const TextInputError(),
            const SizedBox(height: 15),

            const HorizontalRule(),

            // Form Modules
            const SizedBox(height: 15),
            if (c.modulesHasError.value == true)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextInputError(text: c.modulesErrorMessage.value),
              ),

            const FormModules(),
          ],
        ));
  }
}