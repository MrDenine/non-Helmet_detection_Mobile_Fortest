import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowMyPage extends StatelessWidget {
  ShowMyPage({this.title});
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
  static final Directory _photoDir = new Directory(
      '/storage/emulated/0/Android/data/com.rmutt.cpe.project.helmet_detection_app/files/pictures');
  // ใส่เพื่อเมื่อสลับหน้า(Tab) ให้ใช้ข้อมูลเดิมที่เคยโหลดแล้ว ไม่ต้องโหลดใหม่
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FileSystemEntity> _photoList;

    Widget buildPhoto(int index) {
      if (index >= _photoList.length) {
        return null;
      }
      print('Loading photo[$index]: ${_photoList[index]}... done');
      return new GestureDetector(
          onTap: () => print('photo[$index]'),
          onLongPress: () => print('SSS'),
          child: Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      // Use small images to fit more on the screen at once
                      child: new Image.file(
                        _photoList[index],

                        // Shows the loading speed more clearly
                        width: 100.0,
                        height: 100.0,
                        scale: 16.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "ข้อมูลรูปภาพ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text("วันที่",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              textAlign: TextAlign.left),
                          Text(
                            "เวลา",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "ละติจูด, ลองติจูด",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        /* mainAxisSize:MainAxisSize.min, */
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title:
                                          const Text('You confirm to delete?'),
                                      //content: const Text('AlertDialog description'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                              icon: Icon(Icons.restore_from_trash))
                        ],
                      ),
                    ),
                  ],
                ),
              )
              /* new Image.file(
          _photoList[index],
          // Use small images to fit more on the screen at once
          // Shows the loading speed more clearly
          width: 250.0,
          height: 250.0,
          scale: 16.0,
          fit: BoxFit.contain,
        ), */
              ));
    }

    Widget buildPhotoList() {
      _photoList = _photoDir.listSync();
      return new ListView.builder(
        itemBuilder: (BuildContext context, int index) => buildPhoto(index),
      );
    }

    return new Scaffold(
      body: new Center(
        child: new Align(
          alignment: Alignment.topCenter,
          child: buildPhotoList(),
        ),
      ),
    );
  }
}
