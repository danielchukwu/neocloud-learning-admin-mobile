import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/list/event_calendar_list.dart';

class EventCalendarBody extends StatelessWidget {
  const EventCalendarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Event and List of CARDS
        SizedBox(height: defaultSize * 3),
        EventCalendarList(data: eventList),
      ],
    );
  }
}
