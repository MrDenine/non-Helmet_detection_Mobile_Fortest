import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helmet_detection_app/page/login.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  bool _rememberMe = false;
  final accoutAuth = FirebaseAuth.instance;

  Widget _buildChangePro() {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/five'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[300],
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                )),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeP() {
    return ElevatedButton(
      onPressed: () => print('s'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[300],
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Change Password",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFb() {
    return ElevatedButton(
      onPressed: () => print('s'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[300],
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.feedback,
                  color: Colors.black,
                )),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Feedback",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAa() {
    return ElevatedButton(
      onPressed: () => print('s'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[300],
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.error,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                "About App",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogout() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          accoutAuth.signOut().then(
                (value) => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  ),
                },
              );
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red, minimumSize: Size(0, 45)),
        child: Text(
          'Log out',
          style: TextStyle(fontSize: 20,color: Colors.white,
                  fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCont() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'แจ้งปัญหา',
          style: TextStyle(fontSize: 15),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.5),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => print('ลิงค์ไปเมลผู้ดูแล'),
            style: ElevatedButton.styleFrom(
                primary: Colors.white, minimumSize: Size(0, 45)),
            child: Text(
              'Click here for reporting the problem',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'บัญชีผู้ใช้',
          style: TextStyle(fontSize: 15),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.5),
          width: double.infinity,
          child: Text(
            accoutAuth.currentUser.email,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ), //แสดงอีเมลผู้ใช้งาน
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: <Widget>[
            SizedBox(width: 70),
            Column(
              children: [
                Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            )
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      _buildChangePro(),
                      SizedBox(height: 10.0),
                      _buildChangeP(),
                      SizedBox(height: 10.0),
                      _buildFb(),
                      SizedBox(height: 10.0),
                      _buildAa(),
                      SizedBox(height: 200.0),
                      _buildAcc(), 
                      SizedBox(height: 10.0),
                      _buildCont(),
                      SizedBox(height: 10.0),
                      _buildLogout(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
