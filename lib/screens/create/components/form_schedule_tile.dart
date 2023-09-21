import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_update_or_delete_inputfield.dart';

// This is a form class module tile widget that shows a modules title and it's order Index
// and then it shows the number of schedules the module has and also an add schedules button
class FormScheduleTile extends StatefulWidget {
  FormScheduleTile({
    super.key,
    required this.schedule,
    required this.index,
    required this.pressUpdateSchedule,
    required this.pressDeleteSchedule,
    this.enableAddDescription = true,
    this.enableAddClasswork = true,
    this.enableUpdateDescription = true,
    this.enableUpdateClasswork = true,
    this.enableSetDateAndTime = true,
    this.enableUpdateTitle = true,
  });

  ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule)
      pressUpdateSchedule;
  final Function(int scheduleIndex) pressDeleteSchedule;
  final bool enableAddDescription;
  final bool enableAddClasswork;
  final bool enableUpdateTitle;
  final bool enableUpdateDescription;
  final bool enableUpdateClasswork;
  final bool enableSetDateAndTime;

  @override
  State<FormScheduleTile> createState() => _FormScheduleTileState();
}

class _FormScheduleTileState extends State<FormScheduleTile> {
  bool _editTitleMode = false;
  bool _editDescriptionMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Index
          const SizedBox(width: 10),
          if (_editTitleMode == false)
            SizedBox(
                width: 30,
                child: TextMedium(
                    title: '${widget.index + 1}', color: Colors.black54)),

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
                onTap: () {
                  if (widget.enableUpdateTitle) {
                    setState(() => _editTitleMode = true);
                  }
                },
                child: TextMedium(
                    title: widget.schedule.title,
                    color: kBlack80,
                    weight: FontWeight.w500),
              )
            : FormUpdateOrDeleteInputField(
                fontSize: 16,
                textColor: kBlack80,
                fontWeight: FontWeight.w500,
                hintText: 'Schedule Title',
                initialValue: widget.schedule.title,
                press: () => setState(() => _editTitleMode = false),
                pressUpdate: updateScheduleTitle,
                pressDelete: deleteSchedule,
              ),

        // description
        _editDescriptionMode == false
            ? widget.schedule.description != null
                ? GestureDetector(
                    onTap: () {
                      if (widget.enableUpdateTitle) {
                        setState(() => _editDescriptionMode = true);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child:
                          TextSmall(title: widget.schedule.description ?? ''),
                    ),
                  )
                : const SizedBox()
            : FormUpdateOrDeleteInputField(
                fontSize: 14,
                textColor: kBlack70,
                hintText: 'Description',
                press: () => setState(() => _editDescriptionMode = false),
                initialValue: widget.schedule.description,
                pressUpdate: updateScheduleDescription),

        // row - add description, add classwork
        const SizedBox(height: 10),
        Row(
          children: [
            // add description btn
            if (widget.enableAddDescription ||
                widget.enableUpdateDescription && _editDescriptionMode == false)
              GestureDetector(
                onTap: () {
                  setState(() => _editDescriptionMode = true);
                },
                child: widget.schedule.description == null
                    ? const TextSmall(
                        title: 'Add Description',
                        color: Colors.black54,
                      )
                    : IconText(
                        title: 'Description Set',
                        fontSize: 14,
                        color: Colors.black54,
                        icon: Icons.mark_chat_read_rounded,
                        iconColor: Colors.green[500],
                      ),
              ),

            if (widget.enableAddDescription == true ||
                widget.enableUpdateDescription)
              const SizedBox(width: 20),

            // add classwork btn

            if (widget.enableAddClasswork || widget.enableUpdateClasswork)
              GestureDetector(
                onTap: showClassworkDialog,
                child: widget.schedule.classwork == null
                    ? const TextSmall(
                        title: 'Add Classwork',
                        color: Colors.black54,
                      )
                    : IconText(
                        title: 'Classwork Set',
                        fontSize: 14,
                        color: Colors.black54,
                        icon: Icons.task,
                        iconColor: Colors.green[500]),
              ),
          ],
        ),

        // set date and time btn
        if (widget.enableSetDateAndTime == true)
          GestureDetector(
            onTap: pressSetDateAndTime,
            child: widget.schedule.dateAndTimeIsPresent()
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
      schedule: widget.schedule,
      index: widget.index,
      updateSchedule: (scheduleIndex, newSchedule) {
        // update this tile
        setState(() {
          widget.schedule = newSchedule;
        });
        // update parent
        widget.pressUpdateSchedule(scheduleIndex, newSchedule);
      },
    );
  }

  void showClassworkDialog() {
    showCreateClassworkDialog(
      schedule: widget.schedule,
      index: widget.index,
      updateSchedule: (scheduleIndex, newSchedule) {
        // update this tile
        setState(() {
          widget.schedule = newSchedule;
        });
        // update parent
        widget.pressUpdateSchedule(scheduleIndex, newSchedule);
      },
    );
  }

  updateScheduleTitle(String title) {
    setState(() => _editTitleMode = false);

    if (title.isNotEmpty && title != widget.schedule.title) {
      var newSchedule =
          ClassScheduleModel.fromInstance(cs: widget.schedule, title: title);
      ;
      setState(() => widget.schedule = newSchedule);

      // update parent
      widget.pressUpdateSchedule(widget.index, newSchedule);
    }
  }

  updateScheduleDescription(String description) {
    setState(() {
      _editDescriptionMode = false;
    });
    if (description.isNotEmpty && description != widget.schedule.description) {
      setState(() {
        widget.schedule = ClassScheduleModel.fromInstance(
            cs: widget.schedule, description: description);
      });
      widget.pressUpdateSchedule(
        widget.index,
        ClassScheduleModel.fromInstance(
          cs: widget.schedule,
          description: description,
        ),
      );
    }
  }

  deleteSchedule() {
    setState(() => _editTitleMode = false);
    widget.pressDeleteSchedule(widget.index);
  }
}
