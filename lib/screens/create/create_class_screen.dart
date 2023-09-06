import 'dart:io';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_add_cover.dart';
import 'package:neocloud_mobile/screens/create/components/form_modules.dart';
import 'package:neocloud_mobile/screens/create/components/form_select_faculty.dart';
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

  // Mock Data
  final List<FacultyModel> _facultiesToSelectFrom = List.generate(15, (index) => FacultyModel(id: '$index', name: 'Cyber Security'));
  final List<UserModel> _usersToSelectFrom = List.generate(15, (index) => UserModel(id: '$index', name: 'John Default', avatar: defaultProfileAvatar));

  File? _coverImgFile;    // class image file
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<FacultyModel> _selectedFaculties = [];  // we'll only use a single Faculty, _selectedFaculties[0] 
  List<UserModel> _selectedEducatorsList = [];
  final List<ClassModuleModel> _modules = [];

  // error handling variables
  bool _coverImgFileHasError = false;
  bool _hodHasError = false;
  bool _educatorsListHasError = false;
  bool _modulesHasError = false;
  String _modulesErrorMessage = '';

  bool isSubmittingForm = false;

  updateClassCoverImage(File file) {
    setState(() { _coverImgFile = file; });
  }

  bool formDataIsValid() {
    // cover must be provided
    if (_coverImgFile == null) {
      setState(() { _coverImgFileHasError = true; });
      return false;
    }
    setState(() { _coverImgFileHasError = false; });

    // a faculty must be provided
    if (_selectedFaculties.isEmpty) {
      setState(() { _hodHasError = true; });
      return false;
    }
    setState(() { _hodHasError = false; });

    // atleast 1 educator must be provided
    if (_selectedEducatorsList.isEmpty) {
      setState(() { _educatorsListHasError = true; });
      return false;
    }
    setState(() { _educatorsListHasError = false; });

    // modules must be provided (at least 3)
    if (_modules.isEmpty || _modules.length < 3) {
      // showTopAlertDialog(text: 'At least 3 modules must be added');
      setState(() { _modulesHasError = true; _modulesErrorMessage = 'At least 3 modules must be added'; });
      return false;
    } 
    setState(() { _modulesHasError = false; _modulesErrorMessage = ''; });

    // All modules must have at least 1 schedule in them
    for (var module in _modules) {
      if (module.classSchedules == null || module.classSchedules != null && module.classSchedules!.length == 0) {
        // showTopAlertDialog(text: 'All specified modules should have at least 1 schedule added');
        setState(() { _modulesHasError = true; _modulesErrorMessage = 'All specified modules should have at least 1 schedule added'; });
        return false;
      }
    }
    setState(() { _modulesHasError = false; _modulesErrorMessage = ''; });

    return true;
  }

  Future<void> submitForm() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  updateSelectedEducators(List<UserModel> users) {
    setState(() { _selectedEducatorsList = users; });
  }

  updateSelectedFaculty(List<FacultyModel> fac) {
    setState(() { _selectedFaculties = fac; });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _scrollController,
                child: Padding(
                  padding: screenPadding,
                  child: buildForm(),
                ),        
              ) 
            ),

            const HorizontalRule(),
            FormFooter(
              formKey: _formKey, 
              btnIsLoading: isSubmittingForm,
              press: () async {
                setState(() { isSubmittingForm = true; });
                // submit form if form data is valid
                print('1');
                if (formDataIsValid()) {
                  print('2');
                  // submit form
                  await submitForm();
                }
                print('3');
                setState(() { isSubmittingForm = false; });
              }
            ),
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
          const SizedBox(height: 30),

          // Class Avatar / Cover
          FormAddCover(press: updateClassCoverImage),
          _coverImgFileHasError ? const TextInputError(text: 'A class requires an image cover') : const SizedBox(),
          
          // Class Name
          const SizedBox(height: 30),
          FormInputField(
            controller: _titleController,
            hintText: 'Class Name', 
            fontSize: 20, 
            fontWeight: FontWeight.w500,
            validator: validateRequireField, 
            press: (_) {},
          ),
          _hodHasError ? const TextInputError() : const SizedBox(),

  
          // Add Faculty
          const SizedBox(height: 15),
          FormSelectFaculty(buttonText: 'Faculty', selectedFacultyList: _selectedFaculties, facultiesToSelectFrom: _facultiesToSelectFrom, updateSelectedFaculty: updateSelectedFaculty),
          _hodHasError ? const TextInputError() : const SizedBox(),
          const SizedBox(height: 15),

          const HorizontalRule(),

          // Description
          const SizedBox(height: 8),
          FormDescription(controller: _descriptionController, press: (_) {}),
          const SizedBox(height: 5),

          const HorizontalRule(),

          // Add Educators
          const SizedBox(height: 15),
          FormSelectUsers(buttonText: 'Educators', avatarText: 'ED', selectedUsersList: _selectedEducatorsList, usersToSelectFrom: _usersToSelectFrom, updateSelectedUsers: updateSelectedEducators,),
          _educatorsListHasError ? const TextInputError() : const SizedBox(),
          const SizedBox(height: 15),

          const HorizontalRule(),

          // Add Modules
          const SizedBox(height: 15),
          _modulesHasError 
          ? Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextInputError(text: _modulesErrorMessage),
          ) : const SizedBox(),
          FormModules(modules: _modules, scrollController: _scrollController),

        ],
      )
    );
  }
}