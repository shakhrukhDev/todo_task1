import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_task/screens/home/home_page.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImage, width: 95,height: 80,),
            const SizedBox(height: 19,),
            const Text('Up Todo', style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w700
            ),)
          ],
        ),
      )
    );
  }
}
