import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helmet_detection_app/capture_detection/HomeScreenCamera.dart';
import 'package:helmet_detection_app/page/changeprofile.dart';
import 'package:helmet_detection_app/provider/google_service.dart';
import 'package:helmet_detection_app/page/settings.dart';
import 'package:helmet_detection_app/page/menu.dart';
import 'package:provider/provider.dart';
import 'page/create-new-account.dart';
import 'page/login.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error $e.code \n Error Message: $e.message');
  }

  runApp(new MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          initialRoute: '/', ////เวลารันหน้าอื่นปิดโค้ดนี้ไว้นะไม่ต้องลบออก////
          routes: {
            '/': (context) => LoginScreen(),
            '/two': (context) => CreateAccount(),
            '/three': (context) => Menu(),
            '/four': (context) => SettingsScreen(),
            '/five': (context) => ChangeProfile(),
          },
          /*  home: Upload(), */
        ),
      );
}
