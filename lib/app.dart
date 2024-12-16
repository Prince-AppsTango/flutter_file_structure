import 'dart:ui';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

DateTime get _now => DateTime.now();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _checkPermissionAndLoadCalendar();
  }

  Future<void> _checkPermissionAndLoadCalendar() async {
    final permissionStatus = await _deviceCalendarPlugin.hasPermissions();
    if (permissionStatus.data == false) {
      final result = await _deviceCalendarPlugin.requestPermissions();
      print('Permission request result: ${result.data}');
      if (result.data == true) {
        _loadCalendarEvents();
      } else {
        print('Permission not generated');
      }
    } else {
      _loadCalendarEvents();
    }
  }

  Future<void> _loadCalendarEvents() async {
    final calendarResult = await _deviceCalendarPlugin.retrieveCalendars();
    if (calendarResult.isSuccess) {
      final calendar = calendarResult.data?.first;
      final eventsResult = await _deviceCalendarPlugin.retrieveEvents(
          calendar?.id,
          RetrieveEventsParams(
              startDate: DateTime(2024, 1, 1),
              endDate: DateTime.now().add(Duration(days: 365))));
      if (eventsResult.isSuccess) {
        setState(() {
          _events = eventsResult.data ?? [];
        });
      }
    }
  }

  bool _hasEventsOnDate(DateTime date) {
    for (var event in _events) {
      if (event.start != null &&
          event.start!.year == date.year &&
          event.start!.month == date.month &&
          event.start!.day == date.day) {
        return true;
      }
    }
    return false;
  }

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
              bool hasEvents = _hasEventsOnDate(date);
              return Container(
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: isToday ? Colors.blue.shade100 : Colors.white,
                ),
                child: Stack(
                  children: [
                    Text(
                      "${date.day}",
                      style: TextStyle(
                        color: isToday ? Colors.blue : Colors.black,
                      ),
                    ),
                    if (hasEvents)
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
