class CalendarYear {
  CalendarYear({
    required List<CalendarMonth> months, 
    required int year
  }) : _months = months, _year = year;
  
  final int _year;
  final List<CalendarMonth> _months;

  int get year => _year;
  List<CalendarMonth> get months => _months;
}


class CalendarMonth {
  CalendarMonth({
    required int startDay, 
    required String month,  
    required int monthNumber,  
    required int daysInMonth
  }) :  _month = month,
        _monthNumber = monthNumber,
        _startDay = startDay, 
        _daysInMonth = daysInMonth;

  final String _month;
  final int _monthNumber;
  // startDay - 1: Tuesday, 2: Wednesday, 3: Thursday, 4: Friday, 5: Saturday, 6: Sunday, 7: Monday
  final int _startDay;
  final int _daysInMonth;

  String get month => _month;
  int get monthNumber => _monthNumber;
  int get startDay => _startDay;
  int get daysInMonth => _daysInMonth;
}


class Calendar {
  Calendar() 
  : _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  final List<String> _months;

  List<String> get months => _months;

  // Returns: e.g {2020: {Jan: {'startDa}}}
  List<CalendarYear> getMultipleCalendarYearData(int startYear, int endYear) {
    assert(startYear < endYear);

    List<CalendarYear> calendarYears = [];
    while (startYear <= endYear) {
      var calendarYear= getCalendarYearData(startYear);
      calendarYears.add(calendarYear);
      startYear += 1;
    }

    return calendarYears;
  }

  CalendarYear getCalendarYearData(int year) {
    // startDay - 1: Tuesday, 2: Wednesday, 3: Thursday, 4: Friday, 5: Saturday, 6: Sunday, 7: Monday
    List<CalendarMonth> calendarMonths = [];

    for (var i = 0; i < 12; i++) {
      var calendarMonth = CalendarMonth(month: _months[i], monthNumber: i+1, startDay: DateTime(year, i+1, 0).weekday, daysInMonth: DateTime(year, i+1, 0).day);
      calendarMonths.add(calendarMonth);
    }
    var calendarYear = CalendarYear(months: calendarMonths, year: year);

    return calendarYear;
  }
}