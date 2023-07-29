import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Index Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text("Index Page"),
    );
  }
}
