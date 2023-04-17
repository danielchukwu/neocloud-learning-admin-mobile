import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/event_calendar_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class EventCalendarBody extends StatelessWidget {
  const EventCalendarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Event Button
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Event", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(eventList.length, (index) => EventCalendarCard(data: eventList[index])),
        ),
      ],
    );
  }
}
