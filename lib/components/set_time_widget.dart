import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/time_slider.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';


class SetTimeGetxController extends GetxController {
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

/// The `_SetTime` class is a Dart class that builds a widget for setting the time using sliders for
/// hours, minutes, and AM/PM.
class SetTime extends StatefulWidget {
  SetTime({
    super.key,
    this.defaultTime,
    required this.press,
  });

  final MyTimeOfDay? defaultTime;
  final Function({ required int hour, required int minute, required bool isAm}) press;

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  var c = Get.put(SetTimeGetxController());

  var hours = List.generate(12, (index) => index + 1).toList();
  var minutes = List.generate(60, (index) => index).toList();
  var amPm = ['AM', 'PM'];
  
  @override
  void initState() {
    super.initState();
    c.setDefault(widget.defaultTime);
  }

  press() {
    widget.press(hour: c.hour.value, minute: c.minute.value, isAm: c.isAm.value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column - Hour
          TimeSlider(
            items: hours,
            defaultSelectedIndex: c.hour.value -1,
            press: (index) {
              c.hour = hours[index].obs;
              press();
            },
          ),
    
          // Column - minute
          TimeSlider(
            items: minutes,
            defaultSelectedIndex: c.minute.value, 
            isMinutesFormat: true,
            press: (index) {
              c.minute = minutes[index].obs;
              press();
            },
          ),
    
          // // Column - Am or PM
          TimeSlider(
            items: amPm,
            defaultSelectedIndex: c.isAm.value ? 0 : 1,
            press: (index) {
              c.isAm = (index == 0).obs;
              press();
            },
          ),

        ],
      ),
    );
  }
}
