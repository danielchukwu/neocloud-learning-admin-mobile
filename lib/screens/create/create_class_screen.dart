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
import 'components/form_description.dart';
import 'components/form_footer.dart';
import 'components/form_header.dart';
import 'components/form_select_users.dart';


/// POPUP
/// This Screen is used in a showDialog, so it will basically not have 
/// its own screen per say but will be used in a pop up environment instead
class CreateClassScreen extends StatelessWidget {
  CreateClassScreen({super.key});

  static String screenName = 'create class';
  var c = Get.put(ClassGetXController());

  @override
  Widget build(BuildContext context) {
    c.enableUpdateTitle = true.obs;
    c.enableAddModules = true.obs;
    c.enableAddSchedules = true.obs;
    c.enableAddScheduleDescription = true.obs;
    c.enableUpdateScheduleDescription = true.obs;
    c.enableAddScheduleClasswork = true.obs;
    c.enableUpdateScheduleClasswork = true.obs;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
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
              ) 
            ),

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
              }
            ),
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
          FormAddCover(press: (file) {
            c.coverImgFile = file.obs;
          },),
          c.coverImgFileHasError.value ? const TextInputError(text: 'A class requires an image cover',) : const SizedBox(),
          
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
          c.hodHasError.value ? const TextInputError() : const SizedBox(),

  
          // Add Faculty
          const SizedBox(height: 15),
          FormSelectFaculty(
            buttonText: 'Faculty', 
            facultiesToSelectFrom: c.facultiesToSelectFrom.value, 
            selectedFacultyList: c.selectedFaculties.value, 
            updateSelectedFaculty: c.updateSelectedFaculty, 
          ),

          c.hodHasError.value ? const TextInputError() : const SizedBox(),
          const SizedBox(height: 15),

          const HorizontalRule(),

          // Description
          const SizedBox(height: 8),
          FormDescription(controller: c.descriptionController.value, press: (_) {}),
          const SizedBox(height: 5),

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
          c.educatorsListHasError.value ? const TextInputError() : const SizedBox(),
          const SizedBox(height: 15),

          const HorizontalRule(),

          // Form Modules
          const SizedBox(height: 15),
          c.modulesHasError.value 
          ? Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextInputError(text: c.modulesErrorMessage.value),
          ) : const SizedBox(),
          
          const FormModules(),

        ],
      )
    );
  }
}