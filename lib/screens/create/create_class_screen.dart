import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_modules.dart';
import 'package:neocloud_mobile/screens/create/components/form_select_faculty.dart';
import 'package:neocloud_mobile/utils/flutter_storage.dart';
import 'package:neocloud_mobile/utils/image_helper.dart';
import 'package:neocloud_mobile/utils/locator.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import 'components/form_description.dart';
import 'components/form_footer.dart';
import 'components/form_header.dart';
import 'components/form_select_users.dart';

/// POPUP
/// This Screen is used in a showDialog, so it will basically not have 
/// its own screen per say but will be used in a pop up environment instead
class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({super.key});
  static String screenName = 'create class';

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  String? _titleField;
  String? _descriptionField;
  List<FacultyModel> _selectedFaculties = [];  // we'll only use a single Faculty, _selectedFaculties[0] 
  final List<FacultyModel> _facultiesToSelectFrom = List.generate(15, (index) => FacultyModel(id: '$index', name: 'Cyber Security'));

  List<UserModel> _selectedEducatorsList = [];
  final List<UserModel> _usersToSelectFrom = List.generate(15, (index) => UserModel(id: '$index', name: 'John Default', avatar: defaultProfileAvatar));
  // Modules
  final List<ClassModuleModel> _modules = [ClassModuleModel(id: '1', title: 'Introduction to Tech', classSchedules: [ClassScheduleModel(id: '1', title: 'What is Tech', classwork: ClassworkModel(id: '1', title: 'Binary Sort Tree', body: 'just do it', duration: 2))])];

  // handle _hod errors and _educatorsList errors
  bool _hodHasError = false;
  bool _educatorsListHasError = false;

  void submitForm() {
    // confirm _hod && _educatorsList are not null 
    if (_selectedFaculties.isEmpty) {
      setState(() { _hodHasError = true; });
      return;
    }
    setState(() { _hodHasError = false; });

    if (_selectedEducatorsList.isEmpty) {
      setState(() { _educatorsListHasError = true; });
      return;
    }
    setState(() { _educatorsListHasError = false; });

    debugPrint(_titleField);
    debugPrint(_descriptionField);
    debugPrint('$_selectedFaculties');
    debugPrint('$_selectedEducatorsList');
  }

  updateClassName(value) { _titleField = value; }
  updateDescription(value) { _descriptionField = value; }

  updateSelectedEducators(List<UserModel> users) {
    setState(() { _selectedEducatorsList = users; });
  }

  updateSelectedFaculty(List<FacultyModel> fac) {
    setState(() { _selectedFaculties = fac; });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultSize * 2)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header (Title, Cancel Icon)
            const FormHeader(title: ''),
            
            // Form Body
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: screenPadding,
                  child: buildForm(),
                ),        
              ) 
            ),

            const HorizontalRule(),
            FormFooter(formKey: _formKey, press: submitForm),
          ],
        ),
      
      ),
    
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: defaultSize * 3),

          // Class Avatar / Cover
          FormAddCover(),
          
          // Class Name
          SizedBox(height: defaultSize * 3),
          FormInputField(
            hintText: 'Class Name', fontSize: defaultSize * 2, fontWeight: FontWeight.w500,
            validator: validateRequireField,
            press: updateClassName,
          ),
  
          // Add Faculty
          SizedBox(height: defaultSize * 1.5 ),
          FormSelectFaculty(buttonText: 'Faculty', selectedFacultyList: _selectedFaculties, facultiesToSelectFrom: _facultiesToSelectFrom, updateSelectedFaculty: updateSelectedFaculty),
          _hodHasError ? const TextInputError() : const SizedBox(),

          SizedBox(height: defaultSize * 2 ),
          const HorizontalRule(),

          // Description
          SizedBox(height: defaultSize * .8 ),
          FormDescription(press: updateDescription),

          SizedBox(height: defaultSize * .5),
          const HorizontalRule(),

          // Add Educators
          SizedBox(height: defaultSize * 1.5 ),
          FormSelectUsers(buttonText: 'Educators', avatarText: 'ED', selectedUsersList: _selectedEducatorsList, usersToSelectFrom: _usersToSelectFrom, updateSelectedUsers: updateSelectedEducators,),
          _educatorsListHasError ? const TextInputError() : const SizedBox(),

          // Add Modules
          SizedBox(height: defaultSize * 1.3 ),
          const HorizontalRule(),

          SizedBox(height: defaultSize * 2 ),
          FormModules(modules: _modules, scrollController: _scrollController),
        ],
      )
    );
  }
}

// final imageHelper = ImageHelper();

class FormAddCover extends StatefulWidget {
  const FormAddCover({
    super.key,
  });

  @override
  State<FormAddCover> createState() => _FormAddCoverState();
}

class _FormAddCoverState extends State<FormAddCover> {
  File? _selectedImage;
  var imageHelper = getIt<ImageHelper>();
  var firebaseStorage = getIt<FirebaseStorage>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final files = await imageHelper.pickImage(); 
        if (files.isNotEmpty) {
          final croppedFile = await imageHelper.cropImage(file: files.first!, aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 2));
          if (croppedFile != null) { 
            setState(() => _selectedImage = File(croppedFile.path));
            debugPrint('UPLOADING IMAGE ...................... 👟👟👟');
            await firebaseStorage.uploadFile(_selectedImage!);
            debugPrint('DONE UPLOADING ........ ');

          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: defaultSize * 20,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          // borderRadius: BorderRadius.all(Radius.circular(defaultSize * .5)),
          image: _selectedImage != null ? DecorationImage(image: FileImage(_selectedImage!), fit: BoxFit.cover) : null,
        ),
        child: _selectedImage == null ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              SizedBox(height: defaultSize * 1.5),
              Icon(Icons.image, color: Colors.black38, size: defaultSize * 4),
              // Text
              SizedBox(height: defaultSize * .5),
              const TextMedium(title: 'Add Cover', weight: FontWeight.w600, color: Colors.black26),
            ],
          ),
        ) : const SizedBox(),
      ),
    );
  }
}