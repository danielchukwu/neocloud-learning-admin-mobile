import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/constants/constants.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_add_cover.dart';
import 'package:neocloud_mobile/screens/create/components/form_modules.dart';
import 'package:neocloud_mobile/screens/create/components/form_select_user.dart';
import 'package:neocloud_mobile/screens/create/controllers/create_class_controller.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import '../../components/images.dart';
import '../../components/texts.dart';
import 'components/form_footer.dart';
import 'components/form_header.dart';
import 'components/form_select_users.dart';

/// POPUP
/// This Screen is used in a showDialog, so it will basically not have
/// its own screen per say but will be used in a pop up environment instead
class CreateClassInstanceScreen extends StatelessWidget {
  CreateClassInstanceScreen({super.key, this.clas});

  final ClassModel? clas;
  static String screenName = 'create class instance';
  var c = Get.put(ClassGetXController());

  @override
  Widget build(BuildContext context) {
    c.reset();

    if (clas != null) {
      c.titleController.value.text = clas!.name!;
    }

    c.enableSetDateAndTime = true.obs;
    c.enableAutomateDateTime = true.obs;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          color: getColorOpposite(Theme.of(context).canvasColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header (Title, Cancel Icon)
            const FormHeader(title: ''),

            // Form Body
            _buildBody(context),

            ..._buildFooter(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFooter() {
    return [
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
        },
      ),
    ];
  }

  Expanded _buildBody(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: c.scrollController.value,
        child: Padding(
          padding: screenPadding,
          child: Form(
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

                // Class Instance
                const SizedBox(height: 30),
                FormInputField(
                  controller: c.titleController.value,
                  hintText: 'Auto Generated Class Name',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  validator: validateRequireField,
                  press: (_) {},
                ),
                if (c.hodHasError.value == true) const TextInputError(),

                // Class Name
                const SizedBox(height: 10),
                _buildClassName(context),

                // Add Faculty
                const SizedBox(height: 20),
                FormSelectUser(
                  buttonText: 'Educator',
                  selectedUsers: c.selectedEducatorsList,
                  usersToSelectFrom: c.usersToSelectFrom,
                  updateSelectedUser: c.updateSelectedEducators,
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
                if (c.educatorsListHasError.value == true)
                  const TextInputError(),
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClassName(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.clas != null) {
          return;
        }
        print('Select class');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const RoundBoxAvatar(size: 35, image: defaultBookStackAvatar),

          // Selected faculty Name
          const SizedBox(width: 10),
          TextMedium(
              title: clas != null ? clas!.name! : 'Class name...',
              color: Theme.of(context).canvasColor.withOpacity(.5)),
        ],
      ),
    );
  }
}
