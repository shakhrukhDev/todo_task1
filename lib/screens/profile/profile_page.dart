import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profle Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text("Profile Page"),
    );
  }
}
