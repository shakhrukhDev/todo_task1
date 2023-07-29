import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text("Calendar Page"),
    );
  }
}
