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
    this.enableUpdateDescriptionAndClasswork = false,
    this.enableUpdateDateTime = true,
  });

  final ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule) pressUpdateSchedule;
  final Function(int scheduleIndex) pressDeleteSchedule;
  final bool enableUpdateDescriptionAndClasswork;
  final bool enableUpdateDateTime;

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
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Index
          const SizedBox(width: 10),
          SizedBox(
            width: 30, 
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
        : FormUpdateOrDeleteInputField(fontSize: 16, textColor: kBlack80, fontWeight: FontWeight.w500, hintText: 'Schedule Title', initialValue: _schedule.title, pressUpdate: updateScheduleTitle, pressDelete: deleteSchedule),

        // description
        _editDescriptionMode == false
        ? _schedule.description != null 
          ? GestureDetector(
                onTap: () => setState(() { _editDescriptionMode = true; }),
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: TextSmall(title: _schedule.description ?? ''),
                ),
            )
          : const SizedBox()
        : FormUpdateOrDeleteInputField(fontSize: 14, textColor: kBlack70, hintText: 'Description', initialValue: _schedule.description, pressUpdate: updateScheduleDescription),

    
        // row - add description, add classwork
        const SizedBox(height: 10),
        widget.enableUpdateDescriptionAndClasswork == false ? const SizedBox() :
        Row(
          children: [
            // add description btn
            _schedule.description == null && _editDescriptionMode == false
            ? GestureDetector(
                onTap: () => setState(() => _editDescriptionMode = true  ),
                child: const TextSmall(title: 'Add Description', 
                color: Colors.black54,
              ),
            )
            : const SizedBox(),
    
            // add classwork btn
            _schedule.description == null && _editDescriptionMode == false ? const SizedBox(width: 20) : const SizedBox(),
            GestureDetector(
              onTap: pressAddClasswork,
              child: TextSmall(
                title: _schedule.classwork == null ? 'Add Classwork' : 'View Classwork',
                color: Colors.black54, 
              ),
            ),
          ],
        ),

        // set date and time btn
        widget.enableUpdateDateTime == false 
        ? const SizedBox() 
        : GestureDetector(
              onTap: pressSetDateAndTime,
              child: _schedule.dateAndTimeIsPresent()
                ? IconText(
                  title: 'Schedule Set',
                  icon: Icons.check_circle_outline_outlined,
                  spaceBetweenSize: 7,
                  iconColor: Colors.green[500],
                  fontSize: 14,
                  iconSize: 16,
                )
                : IconText(
                    title: 'Set Date and Time',
                    icon: Icons.edit_calendar_outlined,
                    spaceBetweenSize: 7,
                    iconColor: Colors.grey[700],
                    fontSize: 14,
                    iconSize: 16,
                  ),
            )
      ],
    );
  }

  void pressSetDateAndTime() {
    showSetDateAndTime(
      schedule: _schedule, 
      index: widget.index, 
      updateSchedule: (scheduleIndex, newSchedule) {
        // update this tile
        setState(() {_schedule = newSchedule;});
        // update parent
        widget.pressUpdateSchedule(scheduleIndex, newSchedule);
      },
    );
  }

  void pressAddClasswork(){
    showCreateClassworkDialog(
      schedule: _schedule,
      index: widget.index,
      updateSchedule: (scheduleIndex, newSchedule) {
        // update this tile
        setState(() {_schedule = newSchedule;});
        // update parent 
        widget.pressUpdateSchedule(scheduleIndex, newSchedule);
      },
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
