import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/validation.dart';

// This is a form class module tile widget that shows a modules title and it's order count
// and then it shows the number of schedules the module has and also an add schedules button
class FormScheduleTile extends StatefulWidget {
  const FormScheduleTile({
    super.key,
    required this.schedule,
    required this.count,
    required this.pressUpdateSchedule,
    required this.pressDeleteSchedule,
  });

  final ClassScheduleModel schedule;
  final int count;
  final Function(ClassScheduleModel schedule, ClassScheduleModel newSchedule) pressUpdateSchedule;
  final Function(ClassScheduleModel module) pressDeleteSchedule;

  @override
  State<FormScheduleTile> createState() => _FormScheduleTileState();
}

class _FormScheduleTileState extends State<FormScheduleTile> {
  bool _editTitleMode = false;
  bool _editDescriptionMode = false;
  late ClassScheduleModel _schedule;

  @override
  void initState() {
    super.initState();
    _schedule = widget.schedule;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultSize * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Count
          SizedBox(width: defaultSize),
          SizedBox(
            width: defaultSize * 3, 
            child: _editTitleMode == false
            ? TextMedium(title: '${widget.count}', color: Colors.black54)
            : SizedBox(),
          ),

          // Column - Title, Row (schedules count, add schedules btn)
          Expanded(child: buildBody())
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        _editTitleMode == false 
        ? GestureDetector(
            onTap: () => setState(() { _editTitleMode = true; }),
            child: TextMedium(  title: _schedule.title, color: kBlack80, weight: FontWeight.w500),
          )
        : FormUpdateDeleteInputField(initialValue: _schedule.title, pressUpdate: updateScheduleTitle, pressDelete: deleteSchedule),

        // description
        _editDescriptionMode == false
        ? _schedule.description != null 
          ? GestureDetector(
                onTap: () => setState(() { _editDescriptionMode = true; }),
                child: TextSmall(title: _schedule.description ?? ''),
            )
          : SizedBox()
        : FormUpdateDeleteInputField(initialValue: _schedule.description, pressUpdate: updateScheduleDescription, pressDelete: deleteSchedule),

    
        // row - schedules count, add schedules
        SizedBox(height: defaultSize),
        Row(
          children: [
            // add description btn
            _editDescriptionMode == true || _schedule.description == null 
            ? GestureDetector(
                onTap: () => setState(() {
                  _editDescriptionMode = true;
                }),
                child: IconText(title: 'Description', icon: Icons.add, fontSize: defaultSize * 1.4, color: Colors.black54, iconColor: Colors.black54),
              )
            : const SizedBox(),
    
            // add classwork btn
            SizedBox(width: defaultSize * 2),
            IconText(title: 'Classwork', icon: Icons.add, fontSize: defaultSize * 1.4, color: Colors.black54, iconColor: Colors.black54),
          ],
        )
      ],
    );
  }

  updateScheduleTitle(String title) {
    if (title.isNotEmpty) {
      widget.pressUpdateSchedule(_schedule,  ClassScheduleModel.fromInstance(cs: _schedule, title: title));
      setState(() { _editTitleMode = false; });
    }
  }

  updateScheduleDescription(String description) {
    if (description.isNotEmpty) {
      widget.pressUpdateSchedule(_schedule,  ClassScheduleModel.fromInstance(cs: _schedule, description: description));
      setState(() { _editDescriptionMode = false; });
    }
  }

  deleteSchedule() {
    // delete schedule
    widget.pressDeleteSchedule(_schedule);
    // turn of edit mode
    setState(() { _editTitleMode = false; _editDescriptionMode = false; });    
  }
}


/// This widget displays an input field that enables a user to update ... It is special because when it's tapped on it displays an input
class FormUpdateDeleteInputField extends StatelessWidget {
  const FormUpdateDeleteInputField({
    super.key,
    this.initialValue,
    this.autoFocus = true,
    required this.pressUpdate,
    required this.pressDelete,
  });

  final String? initialValue;
  final bool autoFocus;
  final Function(String) pressUpdate;
  final Function() pressDelete;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return  Row(
      children: [
        // Textarea - Edit Title
        Expanded(
          child: Container(
            // color: kRed,
            height: defaultSize * 2.4,
            child: Stack(
              children: [
                Positioned(
                  height: defaultSize * 5,
                  width: SizeConfig.screenWidth! / 1.4,
                  top: -10,
                  child: Container(
                    // color: kGreen,
                    child: FormTextarea(
                      initialValue: initialValue,
                      controller: controller,
                      maxLines: 1,
                      validator: validateRequireField, 
                      press: (_) {}, 
                      autoFocus: autoFocus,
                      pressOnKeyboardDone: () => pressUpdate(controller.text),
                      onTapOutside: (_) {
                        // We delay the call of this just incase the user tapped on the delete icon, 
                        // this wouldn't prevent the delete action
                        Future.delayed(const Duration(milliseconds: 300), pressUpdate(controller.text));
                      },
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),

        // Icon
        GestureDetector(
          // onTap: () {
          //   widget.pressDeleteSchedule(_schedule);
          // },
          onTap: pressDelete,
          child: Icon(Icons.delete_outline, color: kRed.withOpacity(.9), size: defaultSize * 2)
        ),
      ],
    );
    ;
  }
}