import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:helmet_detection_app/profile.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _rememberMe = false;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300],
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 45.0,
          child: TextFormField(
            validator: RequiredValidator(errorText: "กรุณากรอกชื่อผู้ใช้งาน"),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Enter your Name',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onSaved: (String name) {
              profile.name = name;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSurname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Surname',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300],
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 45.0,
          child: TextFormField(
            validator:
                RequiredValidator(errorText: "กรุณากรอกนามสกุลผู้ใช้งาน"),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Enter your Surname',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onSaved: (String surname) {
              profile.surname = surname;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300],
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 45.0,
          child: TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "กรุณากรอกอีเมล"),
              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
            ]),
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String email) {
              profile.email = email;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300],
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 45.0,
          child: TextFormField(
            validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            obscureText: true,
            onSaved: (String password) {
              profile.password = password;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300],
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 45.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcceptCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'I accept the terms of the argreement',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccountBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            try {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: profile.email, password: profile.password);
              formKey.currentState.reset();
            } on FirebaseAuthException catch (e) {
              print(e.message);
            }
          }
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.amber,
        child: Text(
          'Create Account',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
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
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 80),
                    Column(
                      children: [
                        Text(
                          'Helmet',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text('Capture'),
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
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    height: 2.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                _buildName(),
                                SizedBox(height: 10.0),
                                _buildSurname(),
                                SizedBox(height: 10.0),
                                _buildEmailTF(),
                                SizedBox(height: 10.0),
                                _buildPasswordTF(),
                                SizedBox(height: 10.0),
                                _buildConfirmPassword(),
                                SizedBox(height: 20.0),
                                _buildAcceptCheckbox(),
                                SizedBox(height: 20.0),
                                _buildCreateAccountBtn()
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
