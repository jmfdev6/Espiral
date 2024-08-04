import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:espiral_app/src/controllers/calendar_controller.dart';

import 'dialogs/event_detail.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<Map<DateTime, List<Map<String, dynamic>>>>(
          valueListenable: CalendarController.events,
          builder: (context, events, child) {
            return ValueListenableBuilder<DateTime>(
              valueListenable: CalendarController.selectedDay,
              builder: (context, selectedDay, child) {
                return TableCalendar(
                  calendarStyle: CalendarStyle(tablePadding: EdgeInsets.all(10)),
                  focusedDay: selectedDay,
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  eventLoader: (day) => events[day] ?? [],
                  onDaySelected: (selectedDay, focusedDay) {
                    CalendarController.selectedDay.value = selectedDay;
                  },
                  firstDay: DateTime.utc(2023),
                  lastDay: DateTime.utc(2030),
                  locale: 'pt_br',
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                );
              },
            );
          },
        ),
        Expanded(
          child: ValueListenableBuilder<DateTime>(
            valueListenable: CalendarController.selectedDay,
            builder: (context, selectedDay, child) {
              final events = CalendarController.events.value[selectedDay] ?? [];
              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return GestureDetector(
                    child: Dismissible(
                      key: Key(event['titulo']),
                      onDismissed: (direction) {
                        CalendarController.removeEvent(selectedDay, index);
                      },
                      child: Hero(
                         tag: '${event['titulo']}-${selectedDay.toString()}',
                        child: Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            title: Text(event['titulo']),
                          subtitle:Wrap(
                          direction: Axis.vertical,
                          children: [
                            
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                            SizedBox(width: 2,),
                                Text("${event['adress']}"),
                              ],
                            ),
                            SizedBox(height: 10,),
                                               Row(
                          children: [
                            Icon(Icons.schedule_outlined),
                            SizedBox(width: 8,),
                            Text(" ${event['inicio']}"),
                            SizedBox(width: 8,),
                            Text("${event['final']}"),
                          ],
                                               )
                          ],
                                              ),
                         onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailScreen(
                              event: event,
                              selectedDay: selectedDay,
                            ),
                          ),
                        );
                      },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
