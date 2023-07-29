import 'package:flutter/material.dart';

class FocusPage extends StatelessWidget {
  const FocusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text("Focus Page"),
    );
  }
}
