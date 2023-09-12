import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/pills.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';

class FormScheduleTimeGenerator extends StatelessWidget {
  FormScheduleTimeGenerator({
    super.key, 
    required this.modules,
    required this.press,
  });

  final List<ClassModuleModel> modules;
  final Function(List<ClassModuleModel> modules) press;
  List<String> classStartsList = ['This week', 'Next week', 'Next 2 weeks', 'Next 3 weeks', 'Next Month'];
  // selections
  int classStartsIndex = 0;
  List<DayandTime> selectedDayTimes = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildClassStartsSelection(),
                  
                      const SizedBox(height: 20),
                      const HorizontalRule(),
                      const SizedBox(height: 20),
                
                      AddScheduleDateAndTime(
                        press: (dayTimeList) {
                          selectedDayTimes = dayTimeList;
                        }
                      ),
                
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppsButton(
                  title: 'Generate', 
                  press: submitForm
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  submitForm(_) {
    debugPrint('');
    debugPrint('');
    debugPrint('');
    assert(selectedDayTimes.isNotEmpty);

    // STEP 0: to store end result
    List<ClassScheduleModel> result = [];

    // STEP 1: get start date
    // DateTime dateTime = getStartDatetime();
    DateTime dateTime = DateTime(2023, 12, 29);

    // STEP 2: sort selected days data
    var selectedDaysSorted = DayandTime.sort(selectedDayTimes);
    var dayIndex = 0;

    // STEP 3: setting schedules
    for (var i = 0; i < modules.length; i++) {
      if (modules[i].classSchedules == null) continue;
      DateTime dateTime2;

      // loop over schedules
      for (var j = 0; j < modules[i].classSchedules!.length; j++) {
        //  if all weekdays for this particular week has been allocated to schedule, let's jump to next week
        if (dayIndex == selectedDaysSorted.length) {
          dayIndex = 0;
          dateTime = getDatetimeNextWeek(dateTime);
        }
        
        int selectedDay = selectedDaysSorted[dayIndex].weekday;
        int nextDay = selectedDay - dateTime.weekday;

        // set a day that is not behind current day selection
        while(nextDay < 0) {
          dayIndex += 1;
          if (dayIndex == selectedDaysSorted.length){
            dayIndex = 0;
            dateTime = getDatetimeNextWeek(dateTime);
            nextDay = selectedDay - dateTime.weekday;
            break;
          }
          nextDay = selectedDaysSorted[dayIndex].weekday - dateTime.weekday;
        }

        dateTime2 = dateTime.add(Duration(days: nextDay));

        var schedule = modules[i].classSchedules![j];
        var newSchedule = ClassScheduleModel.fromInstance(
          cs: schedule,
          dateSelection: DateSelection(year: dateTime2.year, month: dateTime2.month, day: dateTime2.day),
          startTime: selectedDaysSorted[dayIndex].startTime ?? const MyTimeOfDay(hour: 10, minute: 0, isAm: true),
          endTime: selectedDaysSorted[dayIndex].endTime ??  const MyTimeOfDay(hour: 12, minute: 0, isAm: true),
        );
        result.add(newSchedule);

        debugPrint('Title: ${newSchedule.title}');
        debugPrint('DayTime: Day: ${newSchedule.date!.day} | Start ${newSchedule.startTime} | End: ${newSchedule.endTime}');
        debugPrint('');
        
        dayIndex += 1;
      }
    }

    // Submit updated modules
    press(modules);
  }

  getStartDatetime() {
    var now = DateTime.now();

    if (classStartsList[classStartsIndex] == 'Next Month') {
      return DateTime(now.year, now.month + 1, 1);
    } 
    // start day
    int startDay = now.day + (classStartsIndex * 7); // this week x + (0 * 7), next week x + (1 * 7), next 2 weeks x + (2 * 7)

    // ensure next week is set to weekday 1 (monday) of next week
    if (now.day != startDay) {
      // start day datetime
      var dateTime = DateTime(now.year, now.month, startDay);
      // start day set to monday of whatever week we are in
      startDay = startDay - (dateTime.weekday - 1);
    }
    
    return DateTime(now.year, now.month, startDay);
  }

  getDatetimeNextWeek(DateTime date){
    if (date.weekday == 1) {
      int day = date.day + 7;
      return DateTime(date.year, date.month, day);
    } 

    int day = date.day + (8 - date.weekday);
    return DateTime(date.year, date.month, day);
  }

  Widget buildClassStartsSelection() {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium(
            title: 'Class Starts',
            weight: FontWeight.w600,
            color: Colors.grey[500],
          ),
    
          const SizedBox(height: 15),
    
          SelectPillsWithLimit(
            selectionLimit: 1, 
            selectionBgColor: Colors.black87, 
            items: classStartsList,
            pressAdd: (indexes) {
              classStartsIndex = indexes[0];
            },
          ),
        ],
      ),
    );
  }
}


class AddScheduleDateAndTime extends StatefulWidget {
  const AddScheduleDateAndTime({
    super.key,
    required this.press,
  });

  final Function(List<DayandTime>) press;

  @override
  State<AddScheduleDateAndTime> createState() => _AddScheduleDateAndTimeState();
}

class _AddScheduleDateAndTimeState extends State<AddScheduleDateAndTime> {
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> weekdaysFullname = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  List<DayandTime> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Select days classes would hold on
        buildWhenClassesHold(),
    
        const SizedBox(height: 20),
        const HorizontalRule(),
        const SizedBox(height: 20),
    
        // List - Day and Set Time 
        Column(
          children: List.generate(
            selectedDays.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: TitleAndSetTimeTile(daytime: selectedDays[index]),
            ),
          )
        )
      ],
    );
  }

  Widget buildWhenClassesHold() {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          TextMedium(
            title: 'Classes Holds On',
            weight: FontWeight.w600,
            color: Colors.grey[500],
          ),
      
          // Options
          const SizedBox(height: 15),
          SelectPillsWrap(
            items: weekdays,
            pressAdd: (index) {
              setState(() => selectedDays.add(DayandTime(weekday: index+1, title: weekdaysFullname[index])));
              widget.press(selectedDays);
            },
            pressRemove: (index) {
              var dayTitle = weekdays[index];
    
              for (var day in selectedDays) {
                if (day.title.contains(dayTitle)) {
                  setState(() => selectedDays.remove(day));
                  break;
                }
              }
              widget.press(selectedDays);
            },
          ),
        ],
      ),
    );
  }
}



class TitleAndSetTimeTile extends StatefulWidget {
  const TitleAndSetTimeTile({
    super.key,
    required this.daytime,
  });

  final DayandTime daytime;

  @override
  State<TitleAndSetTimeTile> createState() => _TitleAndSetTimeTileState();
}

class _TitleAndSetTimeTileState extends State<TitleAndSetTimeTile> {
  late DayandTime _daytime;
  
  @override
  void initState() {
    super.initState();
    _daytime = widget.daytime;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title
        TextMedium(
          title: widget.daytime.title,
          color: Colors.grey[800],
          weight: FontWeight.w600,
        ),
        
        // Set Time or Time Selected
        InkWell(
          onTap: () {
            showSetTime(
              title: 'End Time',
              defaultTime: _daytime.endTime,
              press: (timeOfDay) {
                if (_daytime.startTime != null && compareTimeOfDay(timeOfDay, _daytime.startTime!)) return;
                setState(() => _daytime.endTime = timeOfDay );
              }
            );
            showSetTime(
              title: 'Start Time',
              defaultTime: _daytime.startTime,
              press: (timeOfDay) {
                if (_daytime.endTime != null && compareTimeOfDay(timeOfDay, _daytime.endTime!)) return;
                setState(() => _daytime.startTime = timeOfDay );
              }
            );
          },
          child: Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: timeIsSet(widget.daytime) ? Colors.white : kBlueLight,
              border: Border.all(color: Colors.black26, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5))
            ),
            child: Center(
              child: TextMedium(
                title: timeIsSet(widget.daytime) ? getTimeFormat(widget.daytime) : 'Set Time',
                color: timeIsSet(widget.daytime) ? Colors.black87 : Colors.white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  bool compareTimeOfDay(TimeOfDay t1, TimeOfDay t2) {
    return t1.hour == t2.hour && t1.minute == t2.minute;
  }

  bool timeIsSet(DayandTime daytime) {
    return daytime.startTime != null && daytime.endTime != null;
  }

  String getTimeFormat(DayandTime daytime) {
    String getMinuteFormat(int num) => num < 10 ? '0$num' : '$num';
    String startHour = getMinuteFormat(daytime.startTime!.hour);
    String startMinute = getMinuteFormat(daytime.startTime!.minute);
    String endHour = getMinuteFormat(daytime.endTime!.hour);
    String endMinute = getMinuteFormat(daytime.endTime!.minute);

    String start = startHour + ':' + startMinute;
    String end = endHour + ':' + endMinute;

    return '$start - $end';
  }
}
