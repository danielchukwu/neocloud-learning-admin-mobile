import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import 'components/form_description.dart';
import 'components/form_footer.dart';
import 'components/form_header.dart';
import 'components/form_select_user.dart';
import 'components/form_select_users.dart';

/// POPUP
/// This Screen is used in a showDialog, so it will basically not have 
/// its own screen per say but will be used in a pop up environment instead
class CreateFacultyScreen extends StatefulWidget {
  const CreateFacultyScreen({super.key});
  static String screenName = 'create faculty';

  @override
  State<CreateFacultyScreen> createState() => _CreateFacultyScreenState();
}

class _CreateFacultyScreenState extends State<CreateFacultyScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _titleField;
  String? _descriptionField;
  List<UserModel> _selectedHods = [];
  List<UserModel> _selectedEducatorsList = []; 
  final List<UserModel> _usersToSelectFrom = List.generate(15, (index) => UserModel(id: '$index', name: 'John Default', avatar: defaultProfileAvatar));

  // handle _hod errors and _educatorsList errors
  bool _hodHasError = false;
  bool _educatorsListHasError = false;

  void submitForm() {
    // confirm _hod && _educatorsList are not null 
    if (_selectedHods.isEmpty) {
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
    debugPrint('$_selectedHods');
    debugPrint('$_selectedEducatorsList');
  }

  updateFacultyName(value) { _titleField = value; }
  updateDescription(value) { _descriptionField = value; }

  updateSelectedEducators(List<UserModel> users) {
    setState(() { _selectedEducatorsList = users; });
  }

  updateSelectedHod(List<UserModel> users) {
    setState(() { _selectedHods = users; });
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
          
          // Faculty Name
          SizedBox(height: defaultSize * 3),
          FormInputField(
            hintText: 'Faculty Name', fontSize: defaultSize * 2, fontWeight: FontWeight.w500,
            validator: validateRequireField,
            press: updateFacultyName,
          ),
  
          // hod Input
          SizedBox(height: defaultSize * 1.5 ),
          FormSelectUser(buttonText: 'HOD', selectedUsersList: _selectedHods, usersToSelectFrom: _usersToSelectFrom, updateSelectedUser: updateSelectedHod),
          _hodHasError ? TextInputError() : SizedBox(),

          SizedBox(height: defaultSize * 2 ),
          const HorizontalRule(),

          // description
          FormDescription(press: updateDescription),

          SizedBox(height: defaultSize * .5),
          const HorizontalRule(),

          // Educators
          SizedBox(height: defaultSize * 2 ),
          FormSelectUsers(buttonText: 'Educators', selectedUsersList: _selectedEducatorsList, usersToSelectFrom: _usersToSelectFrom, updateSelectedUsers: updateSelectedEducators,),
          _educatorsListHasError ? TextInputError() : SizedBox(),
        ],
      )
    );
  }
}