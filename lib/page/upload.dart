import 'package:flutter/material.dart';

import 'notupload.dart';
import 'uploaded.dart';


class Upload extends StatefulWidget {
  Upload({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
        leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Color(0xffffffff),
          unselectedLabelColor: Color(0x55ffffff),
          tabs: <Tab>[
            Tab(text: 'Not uploaded'),
            Tab(text: 'Uploaded'),
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        children: <Widget>[NotUpload(),Uploaded()],
        controller: controller,
      ),
    );
  }
}