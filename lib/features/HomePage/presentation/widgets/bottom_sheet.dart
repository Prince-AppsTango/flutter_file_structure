import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  const CustomBottomSheet({
    required this.title,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    DateTime _currentDate = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(_currentDate);
    return Container(
      height: 400,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            width: double.maxFinite,
            child: Center(
              child: Text(
                formattedDate,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.pedal_bike,
                color: Colors.red,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.zoom_out_sharp,
                color: Colors.black54,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.wrong_location_outlined,
                color: Colors.green,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.grey),
                child: Table(
                  border: TableBorder.all(color: Colors.white60),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: IntrinsicColumnWidth(),
                    2: FlexColumnWidth(64),
                  },
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.black),
                        children: [
                          Container(
                            width: 80,
                            child: Text(
                              "Icon",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Text("Time",
                                style: TextStyle(color: Colors.white)),
                          ),
                          Container(
                            width: 30,
                            child: Text(
                              "Events",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 80,
                          child: Center(
                              child: Icon(
                            Icons.home,
                            color: const Color.fromARGB(255, 98, 8, 168),
                          )),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80,
                            child: Center(child: Text("3:00")),
                          )),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(title), Icon(Icons.chevron_right)],
                          ),
                        ),
                      ),
                    ])
                  ],
                )),
          )
        ],
      ),
    );
  }
}
