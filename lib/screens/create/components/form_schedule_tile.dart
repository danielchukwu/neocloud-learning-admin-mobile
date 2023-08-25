import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_update_or_delete_inputfield.dart';

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
        : FormUpdateOrDeleteInputField(fontSize: defaultSize * 1.6, textColor: kBlack80, fontWeight: FontWeight.w500, hintText: 'Schedule Title', initialValue: _schedule.title, pressUpdate: updateScheduleTitle, pressDelete: deleteSchedule),

        // description
        _editDescriptionMode == false
        ? _schedule.description != null 
          ? GestureDetector(
                onTap: () => setState(() { _editDescriptionMode = true; }),
                child: Padding(
                  padding: EdgeInsets.only(top: defaultSize * .2),
                  child: TextSmall(title: _schedule.description ?? ''),
                ),
            )
          : SizedBox()
        : FormUpdateOrDeleteInputField(fontSize: defaultSize * 1.4, textColor: kBlack70, hintText: 'Description', initialValue: _schedule.description, pressUpdate: updateScheduleDescription),

    
        // row - add description, add classwork
        SizedBox(height: defaultSize),
        Row(
          children: [
            // add description btn
            _schedule.description == null && _editDescriptionMode == false
            ? GestureDetector(
                onTap: () => setState(() => _editDescriptionMode = true  ),
                child: const TextSmall(title: 'Add Description', color: Colors.black54),
              )
            : const SizedBox(),
    
            // add classwork btn
            _schedule.description == null ? SizedBox(width: defaultSize * 2) : const SizedBox(),
            const TextSmall(title: 'Add Classwork', color: Colors.black54),
          ],
        )
      ],
    );
  }

  updateScheduleTitle(String title) {
    setState(() => _editTitleMode = false );
    if (title.isNotEmpty && title != widget.schedule.title) {
      setState(() { _schedule = ClassScheduleModel.fromInstance(cs: _schedule, title: title); });
      // update the parent screen state
      widget.pressUpdateSchedule(_schedule,  ClassScheduleModel.fromInstance(cs: _schedule, title: title));
    }
  }

  updateScheduleDescription(String description) {
    if (description.isNotEmpty) {
      setState(() {  _schedule = ClassScheduleModel.fromInstance(cs: _schedule, description: description);  _editDescriptionMode = false; });
      widget.pressUpdateSchedule(_schedule,  ClassScheduleModel.fromInstance(cs: _schedule, description: description));
    }
  }

  deleteSchedule() {
    // delete schedule
    debugPrint('FormScheduleTile: DELETING 1');
    widget.pressDeleteSchedule(_schedule);
  }
}
