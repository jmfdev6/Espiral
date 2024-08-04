import 'package:flutter/material.dart';

class CalendarController {
  static final ValueNotifier<Map<DateTime, List<Map<String, dynamic>>>> events = ValueNotifier({});
  static final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());

  static void addEvent(DateTime date, Map<String, dynamic> event) {
    final eventsMap = events.value;

    if (eventsMap[date] != null) {
      eventsMap[date]!.add(event);
    } else {
      eventsMap[date] = [event];
    }
    events.value = Map.from(eventsMap);
  }

  static void removeEvent(DateTime date, int index) {
    final eventsMap = events.value;
    eventsMap[date]!.removeAt(index);
    if (eventsMap[date]!.isEmpty) {
      eventsMap.remove(date);
    }
    events.value = Map.from(eventsMap);
  }
}
