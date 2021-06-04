import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';


class Uploaded extends StatelessWidget {
  Uploaded({this.title});
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MyPage(title: title),
    );
  }
}

class _MyPage extends StatefulWidget {
  _MyPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<_MyPage> with AutomaticKeepAliveClientMixin {
  // ใส่เพื่อเมื่อสลับหน้า(Tab) ให้ใช้ข้อมูลเดิมที่เคยโหลดแล้ว ไม่ต้องโหลดใหม่
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      body: new Center(
        
      ),
    );
  
}
}