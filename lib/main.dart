import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:helmet_detection_app/HomeScreen.dart';

import 'create-new-account.dart';
import 'login.dart';
import 'menu.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error $e.code \n Error Message: $e.message');
  }

  runApp(new MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: '/', ////เวลารันหน้าอื่นปิดโค้ดนี้ไว้นะไม่ต้องลบออก////
            routes: {
                '/': (context) => LoginScreen(),
                '/two': (context) => CreateAccount(),
                '/three': (context) => Menu(),
            },
      //home: Menu(),
    );
  }
}
