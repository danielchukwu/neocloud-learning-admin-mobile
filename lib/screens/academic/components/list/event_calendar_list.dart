import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/event_calendar_card.dart';
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
          children: List.generate(data.length, (index) => EventCalendarCard(data: data[index])),
        );
  }
}