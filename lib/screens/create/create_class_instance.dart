import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
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

class ClassInstanceSettings {
  static bool disableCoverImg = true;
  static bool disableTitle = true;
  static bool disableAddModules = true;
  static bool disableUpdateModules = true;
  static bool disableUpdateScheduleDescriptionAndClasswork = true;
  static bool disableUpdateSetDate = false;
  static bool disableAutomateDateAndTime = false;
}

/// POPUP
/// This Screen is used in a showDialog, so it will basically not have
/// its own screen per say but will be used in a pop up environment instead
class CreateClassInstanceScreen extends StatelessWidget {
  CreateClassInstanceScreen({super.key, this.clas});

  ClassModel? clas;
  static String screenName = 'create class instance';
  var c = Get.put(ClassGetXController());
  var avatar =
      "https://firebasestorage.googleapis.com/v0/b/neocloud-bd1f6.appspot.com/o/files%2Fassets%2Favatars%2Fbook-stack-avatar.png?alt=media&token=e167309c-51b9-4038-a9a4-e0f13987f15d";

  @override
  Widget build(BuildContext context) {
    c.reset();

    clas = ClassModel(
      id: '1',
      name: "Programming",
      about: 'I love to create',
      avatar: avatar,
      educators: [UserModel(id: '1', name: 'nathan davis', avatar: avatar)],
      faculty: FacultyModel(id: '1', name: 'Science'),
      modules: [ClassModuleModel(id: '1', title: 'Introduction', classSchedules: [])],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header (Title, Cancel Icon)
            const FormHeader(title: ''),

            // Form Body
            _buildBody(),

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

  Expanded _buildBody() {
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
                  defaultImage: clas!.avatar,
                  disable: ClassInstanceSettings.disableCoverImg,
                  press: (file) {
                    c.coverImgFile = file.obs;
                  },
                ),

                // Class Instance
                const SizedBox(height: 30),
                FormInputField(
                  controller: c.titleController.value,
                  hintText: 'Auto Generated Class Name',
                  fontSize: 20,
                  isEnabled: ClassInstanceSettings.disableTitle,
                  fontWeight: FontWeight.w500,
                  validator: validateRequireField,
                  press: (_) {},
                ),

                // Class Name
                const SizedBox(height: 10),
                _buildClassName(),

                // Add Faculty
                // TODO: users to select from should be fetched from the database
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
                  buttonText: 'Students',
                  avatarText: 'ST',
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
                FormModules(
                  modules: clas!.modules,
                  enableAddModules: false,
                  enableAutomateDateTime: true,
                  enableUpdateModule: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClassName() {
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
              color: Colors.black54),
        ],
      ),
    );
  }
}
