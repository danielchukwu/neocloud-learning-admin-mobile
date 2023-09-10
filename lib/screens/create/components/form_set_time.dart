import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/set_time_widget.dart';
import 'package:neocloud_mobile/components/time_slider.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/utils/time.dart';


/// The `_TimeController` class is a GetxController that manages the selected hour, minute, and AM/PM
/// values for a time selection feature.
class _TimeController extends GetxController {
  Rx<int> hour = 1.obs;
  Rx<int> minute = 1.obs;
  Rx<bool> isAm = true.obs;

  void setDefault(MyTimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      hour = timeOfDay.hour.obs;
      minute = timeOfDay.minute.obs;
      isAm = timeOfDay.isAm.obs;
    } else {
      var now = DateTime.now();
      hour = (now.hour % 12).toInt().obs;
      minute = now.minute.obs;
      isAm = now.hour < 12 ? true.obs : false.obs;
    }
  }
}


/// The `FormSetTime` class is a stateless widget that displays a form for setting the time and includes
/// a header, a time picker, a "Done" button, and some padding.
class FormSetTime extends StatelessWidget {
  const FormSetTime({
    super.key,
    this.title = 'Set Time',
    this.prevSelectedTime,
    this.defaultTime,
    required this.press,
  });

  final String title;
  final MyTimeOfDay? defaultTime;
  final MyTimeOfDay? prevSelectedTime;
  final Function(MyTimeOfDay data) press;

  @override
  Widget build(BuildContext context) {
    final _TimeController c = Get.put(_TimeController());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeader(title: title),

              _Body(defaultTime: defaultTime, prevSelectedTime: prevSelectedTime),

              // Done Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppsButton(
                  title: 'Done',
                  press: (_) {
                    var timeOfDay = MyTimeOfDay(hour: c.hour.value, minute: c.minute.value, isAm: c.isAm.value);
                    press(timeOfDay);
                    Navigator.pop(context);
                  },
                ),
              ),

              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}


class _Body extends StatefulWidget {
  const _Body({super.key, this.defaultTime, this.prevSelectedTime});

  final MyTimeOfDay? defaultTime;
  final MyTimeOfDay? prevSelectedTime;

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  late MyTimeOfDay timeOfDay;
  final _TimeController c = Get.put(_TimeController());

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    timeOfDay = widget.defaultTime ?? MyTimeOfDay(hour: now.hour, minute: now.minute, isAm: now.hour > 11);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // set time for hours, minutes and AM/PM
        SetTime(
          defaultTime: widget.defaultTime,
          press: ({required hour, required isAm, required minute}) {
            c.hour = hour.obs;
            c.minute = minute.obs;
            c.isAm = isAm.obs;
            setState(() {
              timeOfDay = MyTimeOfDay(hour: hour, minute: minute, isAm: isAm);
            });
          },
        ),

        // Shows Time Difference widget e.g 2h:30m, 0h:45m
        widget.prevSelectedTime != null 
        ? _TimeDifference(
            timeStart: widget.prevSelectedTime!, 
            timeEnd: timeOfDay,
          )
        : const SizedBox(),
      ],
    );
  }
}


class _TimeDifference extends StatelessWidget {
  _TimeDifference({
    super.key, 
    required this.timeStart,
    required this.timeEnd,
  });

  final MyTimeOfDay timeStart;
  final MyTimeOfDay timeEnd;
  var c = Get.put(_TimeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: timeIsValid() ? kBlueLight.withOpacity(.1) : Colors.red[500],
        ),
        child: Text.rich(
          TextSpan(
            style: appsTextStyle(fontWeight: FontWeight.w700, color: timeIsValid() ? Colors.black38 : Colors.white70),
            children: [
              // Hour
              TextSpan(
                text: '${getHour()}',
                style: appsTextStyle(color: timeIsValid() ? kBlueLight : Colors.white, fontWeight: FontWeight.w700),
              ),
              // Text - h
              const TextSpan(text: 'h  '),
              // Minute
              TextSpan(
                text: '${getMinute()}',
                style: appsTextStyle(color: timeIsValid() ? kBlueLight : Colors.white, fontWeight: FontWeight.w700),
              ),
              // Text - m
              const TextSpan(text: 'm'),
            ]
          ),
        ),
      ),
    );
  }

  getHour() {
    return getTimeDiff(timeStart: timeStart, timeEnd: timeEnd).hour;
  }
  getMinute() {
    return getTimeDiff(timeStart: timeStart, timeEnd: timeEnd).minute;
  }
  timeIsValid() => getHour() >= 0;
}