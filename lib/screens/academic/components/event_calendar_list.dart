import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/event_calendar_card.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class EventCalendarList extends StatelessWidget {
  const EventCalendarList({
    super.key,
    required this.data,
  });

  final List<EventCalendar> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // + Add Event Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(title: "Add Event", press: (context) {}),
          ],
        ),

        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(attendanceList.length, (index) => EventCalendarCard(data: data[index])),
        ),

      ],
    );
  }
}