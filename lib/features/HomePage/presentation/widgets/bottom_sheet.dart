import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  const CustomBottomSheet({
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
