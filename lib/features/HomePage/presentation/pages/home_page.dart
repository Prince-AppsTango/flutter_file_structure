import 'package:flutter/material.dart';
import 'package:iconcal/features/HomePage/presentation/widgets/calendar.dart';
import 'package:iconcal/sqflite_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SqfliteHelper helper = SqfliteHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await helper.insertTask("tanmay Project");
                  },
                  child: Text("Create")),
              ElevatedButton(
                  onPressed: () async {
                    var data = await helper.getTasks();
                    print(data);
                  },
                  child: Text("Read")),
              ElevatedButton(
                  onPressed: () async {
                    await helper.updateTask(20, "Hira");
                  },
                  child: Text("Update")),
              ElevatedButton(
                  onPressed: () async {
                    await helper.deleteTask(20);
                  },
                  child: Text("Delete")),
            ],
          ),
        ),
      ),
    );
  }
}
