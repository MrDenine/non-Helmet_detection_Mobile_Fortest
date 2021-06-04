import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';


class NotUpload extends StatelessWidget {
  NotUpload({this.title});
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
  static final Directory _photoDir =
      new Directory('/storage/emulated/0/Android/data/com.rmutt.cpe.project.helmet_detection_app/files/Pictures/');
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
    String pickedDate;
    
     Widget buildPhoto(int index) {

        Future<Widget> _dateViewerX(index) async{
         final tags =  await readExifFromFile( _photoList[index]);
        String dateTime = tags['Image DateTime'].toString();
        pickedDate = dateTime;
        return Container(
            margin: EdgeInsets.symmetric(
              vertical: 20
            ),
            child: pickedDate != null
                ? Text("$pickedDate")
                : Text("EXIFは未取得です")
          );
        }
       
      if (index >= _photoList.length) {
        return null;
      }
       Future<int> deleteFile(index) async {
        try {
          await _photoList[index].delete();
          Navigator.pop(context, 'OK');
        } catch (e) {
          return 0;
        }
        setState(() {
          
        });
      }
      print('Loading photo[$index]: ${_photoList[index]}... done');
      return new GestureDetector(
        onTap: ()=>print('photo[$index]'),
        onLongPress: ()=>print('SSS'),
        child:  Container(
        margin: EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            children: <Widget>[
               Expanded (
                flex: 5,
                child: new Image.file(
          _photoList[index],
          // Use small images to fit more on the screen at once
          // Shows the loading speed more clearly
          width: 150.0,
          height: 150.0,
          scale: 16.0,
          fit: BoxFit.contain,
        ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Text(
                      "ข้อมูลรูปภาพ",
                      style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ), 
                    Row (
                      children: [
                        Text("วันที่",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        textAlign: TextAlign.left),
                        SizedBox(width: 10,),
                        FutureBuilder<Widget>(
                           future: _dateViewerX(index),
                           builder: (context, snapshot) => (
                            Container(
                              margin: EdgeInsets.symmetric(
                              vertical: 20
                            ),
                              child: pickedDate != null
                              ? Text("$pickedDate")
                              : Text("not received")
                             )
                           )
                        )
                      ],
                    ),              
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
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: <Widget>[
                   IconButton(onPressed: ()=>showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('You confirm to upload?'),
          //content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ), icon: Icon(Icons.file_upload)),
      SizedBox(height: 100,),
      IconButton(onPressed: ()=>showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('You confirm to delete?'),
          //content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel',style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () => deleteFile(index),
              child: const Text('OK',style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      ), icon: Icon(Icons.restore_from_trash,color: Colors.red,))
                  ],
                ),
              ),
            ],
          ),
        )
      )
      );
    }
     Widget buildPhotoList() {
      _photoList = _photoDir.listSync();
      return new ListView.builder(
        itemBuilder: (BuildContext context, int index) => buildPhoto(index)
      );
    }
    return  new Scaffold(
      body: new Center(
        child: new Align(
          alignment: Alignment.topCenter,
          child: buildPhotoList(),
        ),
      ),
    );
  }
  
}

