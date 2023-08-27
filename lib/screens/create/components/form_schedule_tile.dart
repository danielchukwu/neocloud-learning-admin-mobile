import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_update_or_delete_inputfield.dart';

// This is a form class module tile widget that shows a modules title and it's order Index
// and then it shows the number of schedules the module has and also an add schedules button
class FormScheduleTile extends StatefulWidget {
  const FormScheduleTile({
    super.key,
    required this.schedule,
    required this.index,
    required this.pressUpdateSchedule,
    required this.pressDeleteSchedule,
  });

  final ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule) pressUpdateSchedule;
  final Function(int scheduleIndex) pressDeleteSchedule;

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
          // Index
          SizedBox(width: defaultSize),
          SizedBox(
            width: defaultSize * 3, 
            child: _editTitleMode == false
            ? TextMedium(title: '${widget.index + 1}', color: Colors.black54)
            : const SizedBox(),
          ),

          // Column - Title, Row (schedules Index, add schedules btn)
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
          : const SizedBox()
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
            _schedule.description == null && _editDescriptionMode == false ? SizedBox(width: defaultSize * 2) : const SizedBox(),
            GestureDetector(
              onTap: () => showCreateClassworkDialog(schedule: _schedule, index: widget.index, updateSchedule: (scheduleIndex, newSchedule) {
                // update this tile
                setState(() {_schedule = newSchedule;});
                // update parent 
                widget.pressUpdateSchedule(scheduleIndex, newSchedule);
              },),
              child: TextSmall(title: _schedule.classwork == null ? 'Add Classwork' : 'View Classwork', color: Colors.black54)),
          ],
        )
      ],
    );
  }

  updateScheduleTitle(String title) {
    setState(() => _editTitleMode = false );
    if (title.isNotEmpty && title != widget.schedule.title) {
      setState(() { _schedule = ClassScheduleModel.fromInstance(cs: _schedule, title: title); });
    }
  }

  updateScheduleDescription(String description) {
    setState(() { _editDescriptionMode = false; });
    if (description.isNotEmpty && description != _schedule.description) {
      setState(() { _schedule = ClassScheduleModel.fromInstance(cs: _schedule, description: description); });
      widget.pressUpdateSchedule(widget.index,  ClassScheduleModel.fromInstance(cs: _schedule, description: description));
    }
  }

  deleteSchedule() {
    widget.pressDeleteSchedule(widget.index);
  }
}
