import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/calendar_widget.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/size_config.dart';


class FormSetDateAndTime extends StatelessWidget {
  FormSetDateAndTime({
    super.key,
    required this.schedule, required this.index, required this.updateSchedule
  });

  ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule) updateSchedule;

  @override
  Widget build(BuildContext context) {
    List<String> weekdaysName = ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'];
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 40),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeader(),

              // Date Buttons
              _StartEndTimeButtons(
                schedule: schedule, 
                index: index, 
                updateSchedule: (scheduleIndex, newSchedule) {
                  schedule = newSchedule;
                  updateSchedule(scheduleIndex, newSchedule);
                },
              ),

              // Days (MO  TU  WE  TH  FR  SA  SU)
              const SizedBox(height: 10),
              buildDays(weekdaysName),

              const HorizontalRule(),

              // Calendar
              Expanded(
                child: CalendarWidget(
                  defaultDateSelection: schedule.date,
                  updateDateSelection: updateDateSelection,
                ),
              ),

              const HorizontalRule(),

              FormFooter(title: 'Done', press: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDays(List<String> weekdaysName) {
    return Container(
      height: 50,
      padding: screenPadding,
      child: GridView.count(
        crossAxisCount: 7, 
        children: List.generate(
          weekdaysName.length, 
          (index) => Center(child: TextMedium(title: weekdaysName[index], weight: FontWeight.w600, color: Colors.grey[600],)),
        ),
      ),
    );
  }

  updateDateSelection(dateSelection) {
    var newSchedule = ClassScheduleModel.fromInstance(cs: schedule, dateSelection: dateSelection);
    schedule = newSchedule;
    updateSchedule(index, newSchedule);
  }
}


class _StartEndTimeButtons extends StatefulWidget {
  const _StartEndTimeButtons({
    super.key,
    required this.index,
    required this.schedule,
    required this.updateSchedule,
  });

  final ClassScheduleModel schedule;
  final int index;
  final Function(int scheduleIndex, ClassScheduleModel newSchedule) updateSchedule;

  @override
  State<_StartEndTimeButtons> createState() => _StartEndTimeButtonsState();
}

class _StartEndTimeButtonsState extends State<_StartEndTimeButtons> {
  // if startTime is true, apply highlighted styles to
  // startTime button if not do so to endTime button
  bool? selectedStartTime;
  late ClassScheduleModel _schedule;

  @override
  void initState() {
    super.initState();
    _schedule = widget.schedule;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: screenPadding,
      child: Row(
        children: [
          // Start Time
          _TitleAndTextButton(
            title: 'Start Time',
            highlighted: selectedStartTime ?? false,
            // highlightedColor: _schedule.startTime != null ? Colors.green[500] : null,
            done: _schedule.startTime != null,
            disabled: false,
            press: () {
              setState(() => selectedStartTime = true );
              showSetTime(
                defaultTime: _schedule.startTime, 
                press: (newTime) {
                  var newSchedule = ClassScheduleModel.fromInstance(cs: _schedule, startTime: newTime);
                  setState(() => _schedule = newSchedule);
                  widget.updateSchedule(widget.index, newSchedule);
                },
              );
            }
          ),
          const Spacer(),
          
          // End Time
          _TitleAndTextButton(
            title: 'End Time', 
            highlighted: selectedStartTime == false,
            done: _schedule.endTime != null,
            disabled: _schedule.startTime == null,
            press: () {
              setState(() => selectedStartTime = false );
              showSetTime(
                prevSelectedTime: _schedule.startTime,
                defaultTime: _schedule.endTime ?? _schedule.startTime,
                press: (newTime) {
                  var newSchedule = ClassScheduleModel.fromInstance(cs: _schedule, endTime: newTime);
                  setState(() => _schedule = newSchedule);
                  widget.updateSchedule(widget.index, newSchedule);
                },
              );
            }),
          // End Time
        ],
      ),
    );
  }
}


class _TitleAndTextButton extends StatelessWidget {
  const _TitleAndTextButton({
    super.key,
    required this.title,
    required this.press,
    this.highlighted = true,
    this.disabled = true,
    this.done = false,
    this.highlightedColor,
  });

  final Function() press;
  final String title;
  final bool highlighted;
  final bool disabled;
  final bool done;
  final Color? highlightedColor;

  @override
  Widget build(BuildContext context) {
    var hColor = disabled == false ? highlightedColor ?? kBlueLight : kBlack.withOpacity(.15);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text
        TextSmall(title: title, color:  highlighted || disabled ? hColor :Colors.grey[700]),

        // Btn
        const SizedBox(height: 5),
        TextButton(
          onPressed: disabled ? null : press,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(kBlack.withOpacity(.05)),
            shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(10)), side: BorderSide(width: 1.5, color:  highlighted || disabled ? hColor : Colors.black26))
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                TextMedium(title: 'Set time', weight: FontWeight.w500, color: highlighted || disabled ? hColor : Colors.grey[600]),
                SizedBox(width: SizeConfig.screenWidth! / 9),
                done 
                ? Icon(Icons.check, color:  Colors.green[500], size: 25)
                : Icon(Icons.add, color:  highlighted || disabled ? hColor :Colors.grey[600], size: 25),
              ],
            ),
          ),
        )
      ],
    );
  }
}
