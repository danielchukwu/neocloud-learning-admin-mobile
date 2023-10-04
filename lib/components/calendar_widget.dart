import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/utils/calendar.dart';
import 'package:neocloud_mobile/utils/locator.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
    this.defaultDateSelection,
    required this.updateDateSelection,
  });

  final DateSelection? defaultDateSelection;
  final Function(DateSelection) updateDateSelection;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Calendar calendar = getIt<Calendar>();
  late List<CalendarYear> calendarYears;
  // This is used to know the exact location of the month section that should be scrolled automatically to when this widget mounts
  late ScrollController _scrollController;
  DateSelection? _dateSelected;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    // Scroll to current month section
    calendarYears =
        calendar.getMultipleCalendarYearData(now.year - 1, now.year + 1);
    int yearHeight = 3900; // calendar year height
    int skipYear = yearHeight * 1;
    double monthHeightPercentage = .083;
    _scrollController = ScrollController(
        initialScrollOffset: skipYear +
            yearHeight * (monthHeightPercentage * ((now.month - 1))));
    _dateSelected = widget.defaultDateSelection;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        color: kBlue.withOpacity(.05),
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(calendarYears.length, (yearIndex) {
            CalendarYear calendarYear = calendarYears[yearIndex];
            List<CalendarMonth> calendarMonths = calendarYear.months;

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
                          // TextMedium(title: '${calendarMonths[monthIndex].month} ${calendarYear.year}', color: Colors.grey[700], weight: FontWeight.w500),
                          Text(
                            '${calendarMonths[monthIndex].month} ${calendarYear.year}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(.7),
                                fontWeight: FontWeight.w500),
                          ),

                          // Days
                          const SizedBox(height: 10),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5),
                            itemCount: calendarMonths[monthIndex].daysInMonth +
                                calendarMonths[monthIndex].startDay,
                            itemBuilder: (context, index) {
                              var now = DateTime.now();
                              bool isCurrentMonth =
                                  calendarYear.year == now.year &&
                                      calendarMonths[monthIndex].monthNumber ==
                                          now.month;
                              int day = (index + 1) -
                                  calendarMonths[monthIndex].startDay;
                              DateSelection dateSelection = DateSelection(
                                  year: calendarYear.year,
                                  month: monthIndex + 1,
                                  day: day);
                              bool dateIsSelected = _dateSelected != null &&
                                  DateSelection.compareDateSelection(
                                      _dateSelected!, dateSelection);

                              if (index < calendarMonths[monthIndex].startDay) {
                                return const SizedBox();
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _dateSelected = dateSelection;
                                    });
                                    // press
                                    widget.updateDateSelection(dateSelection);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: dateIsSelected
                                            ? kBlueLight
                                            : isCurrentMonth && day == now.day
                                                ? kBlueLight.withOpacity(.3)
                                                : null,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        // child: TextMedium(
                                        //   title: '$day',
                                        //   color: dateIsSelected
                                        //   ? Colors.white
                                        //   : Colors.grey[900],
                                        // ),
                                        child: Text(
                                      '$day',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: dateIsSelected
                                            ? getColorOpposite(
                                                Theme.of(context).canvasColor)
                                            : Theme.of(context)
                                                .canvasColor
                                                .withOpacity(.9),
                                      ),
                                    )),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          const HorizontalRule(),
                        ],
                      )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
