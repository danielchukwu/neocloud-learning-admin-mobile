import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';

class EventCalendarBody extends StatelessWidget {
  const EventCalendarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Event and List of CARDS
        SizedBox(height: defaultSize * 3),
        // AttendanceList(data: attendanceList),
      ],
    );
  }
}
