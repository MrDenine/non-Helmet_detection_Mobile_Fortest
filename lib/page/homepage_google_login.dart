import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helmet_detection_app/page/login.dart';
import 'package:helmet_detection_app/page/menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                print('completed to login with google accout');
                return Menu();
              } else if (snapshot.hasError) {
                return Center(child: Text('Something Went Wrong'));
              } else {
                return LoginScreen();
              }
            }),
      );
}
