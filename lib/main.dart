import 'package:flutter/material.dart';
import 'package:helmet_detection_app/login.dart';
import 'capture.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: TfliteHome(),
    );
  }
}
