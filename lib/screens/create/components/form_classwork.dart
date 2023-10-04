import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
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
  const FormClassworkScreen(
      {super.key,
      required this.schedule,
      required this.index,
      required this.updateSchedule});

  final ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule)
      updateSchedule;

  @override
  State<FormClassworkScreen> createState() => _FormClassworkScreenState();
}

class _FormClassworkScreenState extends State<FormClassworkScreen> {
  final _formKey = GlobalKey<FormState>();
  late ClassScheduleModel _schedule;
  late ClassworkModel? _classwork;
  final _durationOptionsData = {'1d': 1, '2d': 2, '3d': 3, '5d': 5, '1w': 7};
  late List<String>
      _durations; // list of keys from _durationOptionsData e.x ['1d', '2d', '3d', ...]

  // classwork field values
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  int _selectedDuration = 4;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    _schedule = widget.schedule;
    _classwork = widget.schedule.classwork;
    _durations = _durationOptionsData.keys.toList();
    titleController.text = _schedule.classwork?.title ?? '';
    descriptionController.text = _schedule.classwork?.body ?? '';
    debugPrint(descriptionController.text);
  }

  submitForm() {
    debugPrint(titleController.text);
    debugPrint(descriptionController.text);
    debugPrint('${_durationOptionsData[_durations[_selectedDuration]]}');

    int? days = _durationOptionsData[_durations[_selectedDuration]];
    var newClasswork = ClassworkModel(
        id: '1',
        title: titleController.text,
        body: descriptionController.text,
        duration: days ?? 7);
    var newClassSchedule = ClassScheduleModel.fromInstance(
        cs: widget.schedule, classwork: newClasswork);
    widget.updateSchedule(widget.index, newClassSchedule);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            // color: Colors.white,
            color: getColorOpposite(Theme.of(context).canvasColor),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                FormIndexTextAndTitleHeader(
                    indexText: 'Schedule ${widget.index + 1}',
                    title: _schedule.title),

                const HorizontalRule(),

                // Form
                Expanded(
                  child: SingleChildScrollView(
                    padding: screenPadding,
                    child: buildForm(_durations),
                  ),
                ),

                const HorizontalRule(),
                FormFooter(title: 'Save', formKey: _formKey, press: submitForm)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Column - classwork  title, description, duration, attach file
  Column buildForm(List<String> durations) {
    return Column(
      children: [
        // Classwork Title Input Field
        const SizedBox(height: 20),
        FormInputField(
          controller: titleController,
          hintText: 'Classwork Title',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          validator: validateRequireField,
          press: (_) {},
        ),

        // Description
        FormDescription(
          controller: descriptionController,
          maxLine: 5,
          press: (_) {},
        ),

        const SizedBox(height: 20),
        const HorizontalRule(),

        // Duration Section - Row (iconText, duration options)
        const SizedBox(height: 20),
        buildDuration(),

        const SizedBox(height: 20),
        const HorizontalRule(),

        // Attach file
        const SizedBox(height: 20),
        IconText(
          title: 'Attach file',
          icon: Icons.attach_file_rounded,
          // iconColor: kBlack70,
          iconColor: Theme.of(context).canvasColor.withOpacity(.7),
        ),

        const SizedBox(height: 50),
      ],
    );
  }

  Row buildDuration() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconText(
          title: 'Duration',
          icon: Icons.access_time_outlined,
          // iconColor: kBlack70,
          iconColor: Theme.of(context).canvasColor.withOpacity(.7),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List.generate(
              _durations.length,
              (index) => GestureDetector(
                  onTap: () => setState(() => _selectedDuration = index),
                  child: AvatarInsertWidget(
                      widget: TextMedium(
                        title: _durations[index],
                        // color: _selectedDuration == index
                        //     ? Colors.white
                        //     : Colors.black54,
                        color: _selectedDuration == index
                            ? getColorOpposite(Theme.of(context).canvasColor)
                            : Theme.of(context).canvasColor.withOpacity(.5),
                      ),
                      backgroundColor: _selectedDuration == index
                          ? kBlueLight
                          : Theme.of(context).canvasColor.withOpacity(.1))),
            ),
          ),
        )
      ],
    );
  }

  Widget buildScheduleListHeader() {
    return IconText(
      title: 'Schedules',
      fontWeight: FontWeight.w500,
      icon: Icons.view_agenda_outlined,
      // iconColor: kBlack60,
      iconColor: Theme.of(context).canvasColor.withOpacity(.6),
      iconSize: 18,
      spaceBetweenSize: 10,
    );
  }
}
