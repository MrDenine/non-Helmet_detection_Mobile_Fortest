import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:helmet_detection_app/camera_test_image_file/camera_take_picture.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _rememberMe = false;
  File _image;
  final picker = ImagePicker();

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
          border: Border.all(color: Colors.black, width: 2.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 2),
              blurRadius: 5.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildAc(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Helmet',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Capture',
                  style: TextStyle(),
                )
              ],
            ),
            SizedBox(
              width: 207,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildAc(
                    () => print('Login with Facebook'),
                    AssetImage(
                      'assets/logos/people.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          '             รถที่ตรวจจับได้ทั้งหมด:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            // height: 0.25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          height: 25.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '      รถที่คุณสามารถตรวจจับได้:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            // height: 0.25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          height: 25.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildSocialBtn(
                            () {
                              getImage();
                            },
                            AssetImage(
                              'assets/logos/camera.png',
                            ),
                          ),
                          _buildSocialBtn(
                            () => print('Gallery'),
                            AssetImage(
                              'assets/logos/gallery.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildSocialBtn(
                            () => Navigator.pushNamed(context, '/six'),
                            AssetImage(
                              'assets/logos/upload.png',
                            ),
                          ),
                          _buildSocialBtn(
                            () => Navigator.pushNamed(context, '/four'),
                            AssetImage(
                              'assets/logos/settings.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
