import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/pills.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';

class FormScheduleTimeGenerator extends StatelessWidget {
  FormScheduleTimeGenerator({super.key});

  List<String> classStartsList = ['This week', 'Next week', 'Next 2 weeks', 'Next 3 weeks', 'Next Month'];
  // selections
  int classStartsSelection = 0;

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
                
                      const AddScheduleDateAndTime(),
                
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppsButton(title: 'Generate', press: (_) {}),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
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
              print(indexes);
              classStartsSelection = indexes[0];
            },
          ),
        ],
      ),
    );
  }
}


class DayandTime {
  DayandTime({
    required this.title,
    this.startTime,
    this.endTime,
  });

  final String title;
  MyTimeOfDay? startTime;
  MyTimeOfDay? endTime;
}


class AddScheduleDateAndTime extends StatefulWidget {
  const AddScheduleDateAndTime({
    super.key,
  });

  @override
  State<AddScheduleDateAndTime> createState() => _AddScheduleDateAndTimeState();
}

class _AddScheduleDateAndTimeState extends State<AddScheduleDateAndTime> {
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> weekdaysFullname = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  List<DayandTime> selectedDays = [
    DayandTime(
      title: 'Thursday',
      startTime: const MyTimeOfDay(hour: 12, minute: 0, isAm: true),
      endTime: const MyTimeOfDay(hour: 2, minute: 30, isAm: false),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Select days classes would hold on
        buildWhenClassesHold(),
    
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
              setState(() => selectedDays.add(DayandTime(title: weekdaysFullname[index])));
            },
            pressRemove: (index) {
              var dayTitle = weekdays[index];
    
              for (var day in selectedDays) {
                if (day.title.contains(dayTitle)) {
                  setState(() => selectedDays.remove(day));
                  break;
                }
                print('1');
              }
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