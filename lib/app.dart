import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

DateTime get _now => DateTime.now();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Object?>(
      controller: EventController<Object?>(),
      child: MaterialApp(
        title: 'Flutter Calendar Page Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: MonthView(
            cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) {
              return Container(
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: isToday ? Colors.blue.shade100 : Colors.white,
                  border: Border.all(
                      color: isInMonth ? Colors.grey : Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "${date.day}",
                        style: TextStyle(
                          color: isToday ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                    if (event.isEmpty)
                      Positioned(
                        bottom: 10,
                        right: 0,
                        left: 0,
                        child: Icon(
                          Icons.event,
                          color: Colors.orange,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return CalendarControllerProvider(
    controller: EventController()..addAll(_events),
    child: MaterialApp(
      title: 'Flutter Calendar Page Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      scrollBehavior: ScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.trackpad,
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: MonthView(
          cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) {
            return Container(
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: isToday ? Colors.blue.shade100 : Colors.white,
                  border: Border.all(
                      color: isInMonth ? Colors.grey : Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ));
          },
        ),
      ),
    ),
  );
}

List<CalendarEventData> _events = [
  CalendarEventData(
    date: _now,
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    title: "Football Tournament",
    description: "Go to football tournament.",
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 3)),
    startTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
    endTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        16),
    title: "Team Meeting",
    description: "Team Meeting",
  ),
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        10),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        12),
    title: "Chemistry Viva",
    description: "Today is Joe's birthday.",
  ),
];
