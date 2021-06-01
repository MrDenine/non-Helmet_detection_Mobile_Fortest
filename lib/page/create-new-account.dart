import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:helmet_detection_app/database_services/user_collection.dart';
import 'package:helmet_detection_app/page/login.dart';
import 'package:helmet_detection_app/data_model/profile.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  final formKey = GlobalKey<FormState>();
  var user;
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    //MinLengthValidator(8, errorText: 'password must be at least 8 digits long'), รหัสผ่าน 8 ตัว /Default 6 ตัว
    //PatternValidator(r'(?=.*?[#?!@$%^&*-])',errorText: 'passwords must have at least one special character') รหัสต้องใช้ตัวอักษรพิเศษ
  ]);
  bool _rememberMe = false;
  bool _isObscure = true;
  bool _showpass = false;
  Profile profile = Profile();
  String password;

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
          child: TextFormField(
            validator: RequiredValidator(errorText: "this field is required"),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
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
          child: TextFormField(
            validator: RequiredValidator(errorText: "this field is required"),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
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
          child: TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "this field is required"),
              EmailValidator(errorText: "enter a valid email address"),
            ]),
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
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
          child: TextFormField(
            onChanged: (val) => password = val,
            validator: passwordValidator,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            obscureText: _isObscure,
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
          child: TextFormField(
            obscureText: _isObscure,
            validator: (val) =>
                MatchValidator(errorText: 'passwords do not match')
                    .validateMatch(val, password),
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
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

  Widget _buildShowPassword() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _showpass,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _showpass = value;
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
          Text(
            'Show password',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
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
            style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.bold),
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
              await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: profile.email, password: profile.password)
                  .then((value) {
                formKey.currentState.reset();
                userSetup(profile.email, profile.name, profile.surname);
                Fluttertoast.showToast(
                    msg: "The account was successfully created.",
                    gravity: ToastGravity.CENTER);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              });
            } on FirebaseAuthException catch (e) {
              //print(e.code);
              //print(e.message);
              Fluttertoast.showToast(
                  msg: e.message, gravity: ToastGravity.CENTER);
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
                    SizedBox(width: 90),
                    Column(
                      children: [
                        Text(
                          'Helmet',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text('Capture',
                          style: TextStyle(color: Colors.white)),
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
                            vertical: 1.0,
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
                                SizedBox(height: 10.0),
                                _buildName(),
                                SizedBox(height: 10.0),
                                _buildSurname(),
                                SizedBox(height: 10.0),
                                _buildEmailTF(),
                                SizedBox(height: 10.0),
                                _buildPasswordTF(),
                                SizedBox(height: 10.0),
                                _buildConfirmPassword(),
                                SizedBox(height: 10.0),
                                _buildShowPassword(),
                                SizedBox(height: 40.0),
                                _buildAcceptCheckbox(),
                                SizedBox(height: 10.0),
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
