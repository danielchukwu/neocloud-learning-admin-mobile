import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_description.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/screens/create/components/from_index_title_header.dart';
import 'package:neocloud_mobile/utils/validation.dart';



/// POPUP
/// This screen is used in a showDialog dialog context, so it basically will be shown in a pop up context 
/// called for now by the FormScheduleTile() widget in the CreateClassworkScreen() for adding classworks to schedules that are created for a class
class FormClassworkScreen extends StatefulWidget {
  const FormClassworkScreen({super.key, required this.schedule, required this.index, required this.updateSchedule});

  final ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule) updateSchedule;

  @override
  State<FormClassworkScreen> createState() => _FormClassworkScreenState();
}

class _FormClassworkScreenState extends State<FormClassworkScreen> {
  final _formKey = GlobalKey<FormState>();
  late ClassScheduleModel _schedule;
  late ClassworkModel _classworkModel;
  final _durationOptionsData = {'1d': const Duration(days:1), '2d': const Duration(days: 2), '3d': const Duration(days: 3), '5d': const Duration(days: 5), '1w': const Duration(days: 7)};

  // classwork field values
  String title = '';
  String description = '';
  int _selectedDuration = 4;

  @override
  void initState() {
    super.initState();
    _schedule = widget.schedule;
    _classworkModel = widget.schedule.classwork ?? ClassworkModel(id: '', title: '', body: '');
  }

  @override
  Widget build(BuildContext context) {
    List<String> durations = _durationOptionsData.keys.toList();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultSize , vertical: defaultSize * 4),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(defaultSize * 2)),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row - Title and Cancel Icon
                const FormHeader(),
                  
                const HorizontalRule(),
                  
                // Schedule Title
                FormIndexTextAndTitleHeader(indexText: 'Schedule ${widget.index + 1}', title: _schedule.title),
          
                const HorizontalRule(),
          
                // Form
                Expanded(
                  child: SingleChildScrollView(
                    padding: screenPadding,
                    child: buildForm(durations),
                  ),
                ),
          
                const HorizontalRule(),
                FormFooter(title: 'Save', formKey: _formKey, press: () => Navigator.pop(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildForm(List<String> durations) {
    return Column(
      children: [
        // Classwork Title Input Field
        SizedBox(height: defaultSize * 2),
        FormInputField(
          hintText: 'Classwork Title', fontSize: defaultSize * 1.8, fontWeight: FontWeight.w500,
          validator: validateRequireField,
          press: (value) {},
        ),

        // Description
        FormDescription(maxLine: 5, press: (v) {}),

        SizedBox(height: defaultSize * 2),
        const HorizontalRule(),

        // Duration Selection
        SizedBox(height: defaultSize* 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(title: 'Duration', icon: Icons.access_time_outlined, color: kBlack70, iconColor: kBlack70),

            SizedBox(width: defaultSize * 2),
            Expanded(
              child: Wrap(
                runSpacing: defaultSize,
                spacing: defaultSize,
                children: List.generate(
                  durations.length, 
                  (index) => GestureDetector(
                    onTap: () => setState(() => _selectedDuration = index ),
                    child: AvatarInsertWidget(widget: TextMedium(title: durations[index], color: _selectedDuration == index ? Colors.white : Colors.black54), backgroundColor: _selectedDuration == index ? kBlueLight : Colors.black12)),
                ),
              ),
            )
          ],
        ),


        SizedBox(height: defaultSize * 2),
        const HorizontalRule(),

        SizedBox(height: defaultSize * 2),
        IconText(title: 'Attach file', icon: Icons.attach_file_rounded, iconColor: kBlack70,),

      ],
    );
  }

  Widget buildScheduleListHeader() {
    return IconText(
      title: 'Schedules',
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      icon: Icons.view_agenda_outlined,
      iconColor: kBlack60,
      iconSize: defaultSize * 1.8,
      spaceBetweenSize: defaultSize * 1,
    );
  }
}


