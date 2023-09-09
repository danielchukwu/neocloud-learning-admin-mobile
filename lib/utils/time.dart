import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';

TimeOfDay getTimeDiff({required MyTimeOfDay timeStart, required MyTimeOfDay timeEnd}) {
  print('StartHour: ${timeStart.hour} | EndHour: ${timeEnd.hour}');
  
  // Start Time
  var startHour = get24HourFormat(timeStart.hour, timeStart.isAm);
  int startHourInMinutes = startHour * 60;
  int time1 = startHourInMinutes + timeStart.minute;
  
  // End Time
  var endHour = get24HourFormat(timeEnd.hour, timeEnd.isAm);
  int hourInMinutes = endHour * 60;
  int time2 = hourInMinutes + timeEnd.minute;

  // Calculation
  int totalMinutesDiff = time2 - time1;
  int hoursDiff = (totalMinutesDiff / 60).floor();
  int minutesLeft = totalMinutesDiff % 60;

  // // Fix - ensures 11:00pm - 12:30am yields 1h 30m
  if (timeStart.isAm && !timeEnd.isAm && hoursDiff > 12) {
    hoursDiff = hoursDiff % 12;
  }
  // if (!timeStart.isAm && timeEnd.isAm && hoursDiff < 0) {
  //   hoursDiff = hoursDiff % 12;
  // }

  return TimeOfDay(hour: hoursDiff, minute: minutesLeft);
}

int get24HourFormat(int time, bool isAm) {
  // assert (time <= 12);
  if (isAm) return time;
  return 12 + time;
}