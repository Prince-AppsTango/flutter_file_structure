import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

// learn from here https://github.com/hyochan/flutter_calendar_carousel

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDate = DateTime.now();
  var todaysEvent = "";
  final Map<DateTime, Icon> _iconsForDays = {
    DateTime(2024, 12, 16): Icon(Icons.local_airport, color: Colors.blue),
    DateTime(2024, 12, 25): Icon(Icons.messenger_outline, color: Colors.green),
    DateTime(2024, 12, 31): Icon(Icons.party_mode, color: Colors.red),
  };

  EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2024, 12, 16): [
        Event(
          date: DateTime(2024, 12, 16),
          title: 'Flight',
          icon: Icon(Icons.local_airport),
        ),
      ],
      DateTime(2024, 12, 25): [
        Event(
          date: DateTime(2024, 12, 25),
          title: 'Message',
          icon: Icon(Icons.messenger_outline),
        ),
      ],
      DateTime(2024, 12, 31): [
        Event(
          date: DateTime(2024, 12, 31),
          title: 'Party',
          icon: Icon(Icons.party_mode),
        ),
      ],
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          for (var event in events) {
            todaysEvent = event.title!;
          }
          showBottomSheet(
              context: context,
              builder: (BuildContext builder) => BottomSheet(
                    title: todaysEvent + date.toString(),
                  ));
          setState(() {
            _currentDate = date;
          });
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          if (_iconsForDays.containsKey(day)) {
            return Center(
              child: _iconsForDays[day],
            );
          }
          return null;
        },
        weekFormat: false,
        markedDatesMap: _markedDateMap,
        height: 420.0,
        selectedDateTime: _currentDate,
        daysHaveCircularBorder: true,
      ),
    );
  }
}

//Bottom sheet

class BottomSheet extends StatelessWidget {
  final String title;
  const BottomSheet({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close"))
        ],
      ),
    );
  }
}
