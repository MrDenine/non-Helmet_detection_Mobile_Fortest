
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _rememberMe = false;

  Widget _buildFb() {
    return ElevatedButton(onPressed: ()=>print('s'), 
    style: ElevatedButton.styleFrom(primary: Colors.grey[300],),
    child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10 ),
        child: Row(
          children: [
            Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.feedback,color: Colors.black,)
              ),
              Container(
                  margin: const EdgeInsets.only( left: 10.0 ),
                  child: Text(
                    "Feedback",
                    style: TextStyle( fontSize: 20.0,color: Colors.black),
                  ))
          ],
        ),
    )
    );
  }

  Widget _buildAa() {
    return ElevatedButton(onPressed: ()=>print('s'), 
    style: ElevatedButton.styleFrom(primary: Colors.grey[300],),
    child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10 ),
        child: Row(
          children: [
            Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.error,color: Colors.black,)
              ),
              Container(
                  margin: const EdgeInsets.only( left: 10.0 ),
                  child: Text(
                    "About App",
                    style: TextStyle( fontSize: 20.0,color: Colors.black),
                  ))
          ],
        ),
    )
    );
  }


  Widget _buildLogout() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5),
      width: double.infinity,
      child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/'),
    style: ElevatedButton.styleFrom(primary: Colors.red,
    minimumSize: Size(0, 45)),
    child: Text('Log out',style: TextStyle(fontSize: 20),)
    )
    );
  }

  Widget _buildCont() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('แจ้งปัญหา',style: TextStyle(fontSize: 15),),
        Container(
      padding: EdgeInsets.symmetric(vertical: 2.5),
      width: double.infinity,
      child: ElevatedButton(onPressed: ()=>print('ลิงค์ไปเมลผู้ดูแล'), 
    style: ElevatedButton.styleFrom(primary: Colors.white,
    minimumSize: Size(0, 45)),
    child: Text('abcd@gmail.com',style: TextStyle(fontSize: 20,color: Colors.black,
    fontWeight: FontWeight.bold),
    )
    )
    )
      ],
    );
  }

  Widget _buildAcc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('บัญชีผู้ใช้',style: TextStyle(fontSize: 15),),
        Container(
      padding: EdgeInsets.symmetric(vertical: 2.5),
      width: double.infinity,
      child: ElevatedButton(onPressed: ()=>print('abc@gmail.com'), 
    style: ElevatedButton.styleFrom(primary: Colors.white,
    minimumSize: Size(0, 45)),
    child: Text('abc@gmail.com',style: TextStyle(fontSize: 20,color: Colors.black,
    fontWeight: FontWeight.bold),
    )
    )
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
                      Text('Settings',style: TextStyle(color: Colors.white,fontSize: 25),),    
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
                    vertical: 29.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[   
                      SizedBox(height: 10.0),
                      _buildFb(),
                      SizedBox(height: 10.0),
                      _buildAa(),
                      SizedBox(height: 180.0),
                      _buildCont(),
                      _buildAcc(),
                      SizedBox(height: 50.0),
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
