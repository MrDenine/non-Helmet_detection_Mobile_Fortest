import 'package:flutter/material.dart';
import 'package:helmet_detection_app/login.dart';
import 'create-new-account.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
       initialRoute: '/', 
            routes: {
                '/': (context) => LoginScreen(),
                '/second': (context) => CreateAccount(),
            },
    );
  }
}
