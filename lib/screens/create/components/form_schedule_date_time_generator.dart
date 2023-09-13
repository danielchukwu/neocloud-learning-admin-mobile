import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/pills.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/tile/tiles.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';

class FormScheduleTimeGenerator extends StatefulWidget {
  const FormScheduleTimeGenerator({
    super.key, 
    required this.modules,
    required this.press,
  });

  final List<ClassModuleModel> modules;
  final Function(List<ClassModuleModel> modules) press;

  @override
  State<FormScheduleTimeGenerator> createState() => _FormScheduleTimeGeneratorState();
}

class _FormScheduleTimeGeneratorState extends State<FormScheduleTimeGenerator> {
  List<String> _classStartsList = ['This week', 'Next week', 'Next 2 weeks', 'Next 3 weeks', 'Next Month'];

  int _classStartsIndex = 0;
  List<DayandTime> _selectedClassDays = [];

  bool _isGenerating = false;

  late List<ClassModuleModel> _modules;

  @override
  void initState() {
    super.initState();
    _modules = widget.modules;
  }


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
                          _selectedClassDays = dayTimeList;
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
                  isLoading: _isGenerating,
                  bgColorLoading: Colors.black12,
                  press: generateSchedulesDateAndTime
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  generateSchedulesDateAndTime(_) async {
    setState(() => _isGenerating = true );
    
    if (_selectedClassDays.isEmpty) {
      showTopAlertDialog(text: 'No days were selected!');
    }

    // STEP 0: to store end result
    List<ClassModuleModel> result = [];

    // STEP 1: get start date
    DateTime dateTime = getStartDatetime();

    // STEP 2: sort selected days data
    var selectedClassDaysSorted = DayandTime.sort(_selectedClassDays);
    var dayIndex = 0;

    // STEP 3: setting schedules
    for (var module in _modules) {
      if (module.classSchedules == null) continue;
      DateTime newDatetime;
      List<ClassScheduleModel> schedules = [];

      // loop over schedules
      for (var schedule in module.classSchedules!) {
        //  if all weekdays for this particular week has been allocated to schedule, let's jump to next week
        if (dayIndex == selectedClassDaysSorted.length) {
          dayIndex = 0;
          dateTime = getDatetimeNextWeek(dateTime);
        }

        int selectedDay = selectedClassDaysSorted[dayIndex].weekday;
        int nextDay = selectedDay - dateTime.weekday;

        // set a day that is not behind current day selection
        while(nextDay < 0) {
          dayIndex += 1;
          if (dayIndex == selectedClassDaysSorted.length){
            dayIndex = 0;
            dateTime = getDatetimeNextWeek(dateTime);
            nextDay = selectedDay - dateTime.weekday;
            break;
          }
          nextDay = selectedClassDaysSorted[dayIndex].weekday - dateTime.weekday;
        }

        newDatetime = dateTime.add(Duration(days: nextDay));

        var newSchedule = ClassScheduleModel.fromInstance(
          cs: schedule,
          dateSelection: DateSelection(year: newDatetime.year, month: newDatetime.month, day: newDatetime.day),
          startTime: selectedClassDaysSorted[dayIndex].startTime ?? const MyTimeOfDay(hour: 10, minute: 0, isAm: true),
          endTime: selectedClassDaysSorted[dayIndex].endTime ??  const MyTimeOfDay(hour: 12, minute: 0, isAm: true),
        );
        schedules.add(newSchedule);

        debugPrint('Title: ${newSchedule.title}');
        debugPrint('DayTime: Day: ${newSchedule.date!.day} | Start ${newSchedule.startTime} | End: ${newSchedule.endTime}');
        debugPrint('');
        
        dayIndex += 1;
      }

      // add module with new updated schedule
      var moduleWithUpatedSchedules = ClassModuleModel.fromInstance(module: module, schedules: schedules);
      result.add(moduleWithUpatedSchedules);
    }

    // Submit updated modules
    widget.press(result);
    
    await Future.delayed(const Duration(seconds: 1));

    showTopAlertDialog(text: 'All Schedules date and time set! 👍', isError: false);
    setState(() => _isGenerating = false );
  }

  getStartDatetime() {
    var now = DateTime.now();

    if (_classStartsList[_classStartsIndex] == 'Next Month') {
      return DateTime(now.year, now.month + 1, 1);
    }

    // start day
    int startDay = now.day + (_classStartsIndex * 7); // this week x + (0 * 7), next week x + (1 * 7), next 2 weeks x + (2 * 7)

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
            items: _classStartsList,
            pressAdd: (indexes) {
              _classStartsIndex = indexes[0];
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
