import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/utils/validation.dart';
import '../../components/buttons.dart';
import '../../components/images.dart';
import '../../components/input/input_fields.dart';
import '../../components/popups/popups.dart';
import '../../components/texts.dart';
import '../../components/widgets.dart';
import '../../constraints.dart';
import '../../size_config.dart';
import 'components/form_footer.dart';
import 'components/form_header.dart';

// This Screen is used in a showDialog, so it will basically not have 
// its own screen per say but will be used in a pop up environment instead
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
  UserModel? _hod;
  List<UserModel> _educatorsList = []; 

  // handle _hod errors and _educatorsList errors
  bool _hodHasError = false;
  bool _educatorsListHasError = false;

  void submitForm() {
    // confirm _hod && _educatorsList are not null also
    if (_hod == null) {
      setState(() { _hodHasError = true; });
      return;
    } else if (_educatorsList.length == 0) {
      setState(() { _educatorsListHasError = true; });
      return;
    }
    setState(() { _hodHasError = false; });
    setState(() { _educatorsListHasError = false; });

    print(_titleField);
    print(_descriptionField);
    print(_hod);
    print(_educatorsList);
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
            press: (value) {
              _titleField = value;
            },
          ),
  
          // hod Input
          SizedBox(height: defaultSize * 1.5 ),
          buildSelectHod(),
          _hodHasError ? TextInputError() : SizedBox(),

          SizedBox(height: defaultSize * 2 ),
          const HorizontalRule(),

          // description
          buildFormIconAndTextarea(),

          SizedBox(height: defaultSize * .5),
          const HorizontalRule(),

          SizedBox(height: defaultSize * 2 ),
          buildSelectEducators(),
          _hodHasError ? TextInputError() : SizedBox(),
        ],
      )
    );
  }

  Row buildSelectEducators() {
  return Row(
    children: [
      // Educators Button
      IconTextButton('Educators', backgroundColor: kBlue.withOpacity(.3), borderColor: kBlue.withOpacity(.8), press: () {}),
      // Avatar
      SizedBox(width: defaultSize * 1.5),
      Expanded(
        child: Stack(
          children: [
            
            // Avatar - +
            Positioned(
              left: 25,
              child: AvatarInsertWidget(backgroundColor: kBlack50, widget: const Icon(Icons.add, color: Colors.white)),
            ),

            // Avatar - AB
            AvatarInsertWidget(backgroundColor: kBlue, widget: const TextMedium(title: 'ED', weight: FontWeight.w600, color: Colors.white)),
        
          ],
        ),
      ),
    ],
  );
}

  buildFormIconAndTextarea () {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Padding(
          padding: EdgeInsets.only(top: defaultSize * 1.3),
          child: Icon(Icons.short_text, color: Colors.black54),
        ),
      
         // TextArea
        SizedBox(width: defaultSize),
        Container(
          width: SizeConfig.screenWidth! / 1.3,
          child: FormTextarea(
            hintText: 'Add Description',
            validator: validateRequireField,
            press: (value) {
              _descriptionField = value;
            },
          )
        ),
      ]
    );
  }

  Row buildSelectHod() {
    return Row(
      children: [
        // select HOD button hod button
        IconTextButton('HOD', backgroundColor: kRed.withOpacity(.1), borderColor: kRed.withOpacity(.7), press: () {
          showSelectDialog();
        }),
        // Avatar
        SizedBox(width: defaultSize * 1.5),
        const RoundBoxAvatar(width: 35, height: 35, image: defaultSlugAvatar),
        // Name
        SizedBox(width: defaultSize * 1 ),
        const TextMedium(title: 'John Doe ...', color: Colors.black54,)
      ],
    );
  }
}
