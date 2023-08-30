import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/utils/calendar.dart';
import 'package:neocloud_mobile/utils/locator.dart';


class FormSetDateAndTime extends StatelessWidget {
  const FormSetDateAndTime({
    super.key,
    required this.schedule, required this.index, required this.updateSchedule
  });

  final ClassScheduleModel schedule;
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

              // Set Start time and End time
              Row(
                children: [
                  // Start Time
                  Column(
                    children: [
                      // Text
                      TextMedium(title: 'Start Time', color: Colors.grey[700]),

                      // Btn
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black12),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(width: 1.5, color: Colors.black54))
                          )
                        ),
                        child: Row(
                          children: [
                            TextMedium(title: 'Set time'),
                            Icon(Icons.add, color: Colors.grey[600], size: 16,)
                          ],
                        ),
                      )
                    ],
                  ),
                  // End Time
                ],
              ),
              

              // Days
              Container(
                height: 50,
                padding: screenPadding,
                child: GridView.count(
                  crossAxisCount: 7, 
                  children: List.generate(
                    weekdaysName.length, 
                    (index) => Center(child: TextMedium(title: weekdaysName[index], weight: FontWeight.w600, color: Colors.grey[600],)),
                  ),
                ),
              ),

              const HorizontalRule(),


              const Expanded(
                child: CalendarWidget(),
              ),

              const HorizontalRule(),

              FormFooter(title: 'Done', press: () => Navigator.pop(context), ),
            ],
          ),
        ),
      ),
    );
  }
}

// {2020: {Jan: {startDay: 2, daysInMonth: 31}, Feb: {startDay: 5, daysInMonth: 31}, Mar: {startDay: 6, daysInMonth: 29}, Apr: {startDay: 2, daysInMonth: 31}, May: {startDay: 4, daysInMonth: 30}, Jun: {startDay: 7, daysInMonth: 31}, Jul: {startDay: 2, daysInMonth: 30}, Aug: {startDay: 5, daysInMonth: 31}, Sep: {startDay: 1, daysInMonth: 31}, Oct: {startDay: 3, daysInMonth: 30}, Nov: {startDay: 6, daysInMonth: 31}, Dec: {startDay: 1, daysInMonth: 30}}, 2021: {Jan: {startDay: 4, daysInMonth: 31}, Feb: {startDay: 7, daysInMonth: 31}, Mar: {startDay: 7, daysInMonth: 28}, Apr: {startDay: 3, daysInMonth: 31}, May: {startDay: 5, daysInMonth: 30}, Jun: {startDay: 1, daysInMonth: 31}, Jul: {startDay: 3, daysInMonth: 30}, Aug: {startDay: 6, daysInMonth: 31}, Sep: {startDay: 2, daysInMonth: 31}, Oct: {startDay: 4, daysInMonth: 30}, Nov: {startDay: 7, daysInMonth: 31}, Dec: {startDay: 2, daysInMonth: 30}},}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Calendar calendar = getIt<Calendar>();
  late List<CalendarYear> calendarYears;
  // This is used to know the exact location of the month section that should be scrolled automatically to when this widget mounts
  final _widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    calendarYears = calendar.getMultipleCalendarYearData(2023, 2024);
  }

  @override
  Widget build(BuildContext context) {
    // This is used to know the exact location of the month section that should be scrolled automatically to when this widget mounts
    // final _widgetKey = GlobalKey();

    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            calendarYears.length, 
            (yearIndex) {
              CalendarYear calendarYear = calendarYears[yearIndex];
              List<CalendarMonth> calendarMonths = calendarYear.months;
      
              print(calendarYear);
              print(calendarMonths);
      
              // return SizedBox();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  calendarMonths.length, 
                  (monthIndex) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Title - Month and Year
                      TextMedium(title: '${calendarMonths[monthIndex].month} ${calendarYear.year}', color: Colors.grey[700], weight: FontWeight.w500),

                      // Days
                      const SizedBox(height: 10),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 5, crossAxisSpacing: 5), 
                        itemCount: calendarMonths[monthIndex].daysInMonth + calendarMonths[monthIndex].startDay,
                        itemBuilder: (context, index) {
                          var now = DateTime.now();
                          bool isCurrentMonth = calendarYear.year == now.year && calendarMonths[monthIndex].monthNumber == now.month;
                          int day = (index + 1) - calendarMonths[monthIndex].startDay;
    
                          // print(calendarMonths[monthIndex].startDay);
                          if (index < calendarMonths[monthIndex].startDay) {
                            return const SizedBox();
                          } else {
                            return Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: isCurrentMonth && day == now.day ? kBlueLight : null,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Center(
                                child: TextMedium(title: '$day', color: isCurrentMonth && day == now.day ? Colors.white : Colors.grey[900],),
                              ),
                            );
                          }
                        },
                      ),
              
                      const SizedBox(height: 20),
                      const HorizontalRule(),
              
                    ],
                  )
                ),
              );
            } 
          ).toList(),
        ),
      ),
    );
  }
}

