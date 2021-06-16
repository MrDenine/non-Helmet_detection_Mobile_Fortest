import 'dart:typed_data';

import 'package:flutter_exif_plugin/flutter_exif_plugin.dart';
import 'package:flutter_exif_plugin/tags.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';

final picker = ImagePicker();
  File _image;
  var locationMessage = '';
  String latitude;
  String longitude;
  final ImagePicker _picker = ImagePicker();
  FlutterExif exif;
  Uint8List imageToRead;
  VideoPlayerController _videoPlayerController;
  File _video;
  final pickerX = ImagePicker();

Future getImage() async {
   var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";
  final PickedFile pickedFile =
      await picker.getImage(source: ImageSource.camera);
       if (pickedFile == null) return ;
          /* _image =  File(imageFile.path);
          print(_image.lengthSync()); */
    Uint8List bytes = await pickedFile.readAsBytes();
    exif = FlutterExif.fromBytes(bytes);
    await exif.setAttribute(TAG_GPS_LATITUDE, latitude);
    await exif.setLatLong(lat, long);
    await exif.saveAttributes();
    imageToRead = await exif.imageData;
    return _image =  File(pickedFile.path);
    
  /* if (pickedFile != null) {
    print('Take image to dir');
    image = File(pickedFile.path);
  } else {
    print('No image seleted.');
  } */
}

Future getVideo() async {
  PickedFile pickedFile = await pickerX.getVideo(source: ImageSource.camera);
    /////////////////////////////////////////////สร้างโฟลเดอร์เก็บวิดีโอ
    final directory = await getExternalStorageDirectory();///ต้องตรวจสอบว่ามีโฟลเดอร์แล้วหรือไม่
    final myImagePath = '${directory.path}/Video' ;
    final myImgDir = await new Directory(myImagePath).create();
    print(myImgDir);
    /////////////////////////////////////////////////////////
    if (pickedFile == null) return null;
    _video = File(pickedFile.path);
    //////////////////////////////////ย้ายไฟล์วิดีโอไปโฟลเดอร์เก็บวิดีโอ
    var basNameWithExtension = path.basename(_video.path);
    var file =  await moveFile(_video,myImagePath+"/"+basNameWithExtension);
    ////////////////////////////////////////////////////////
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((value) {
        /* setState(() {}); */
        _videoPlayerController.play();
      });
}

Future<File> moveFile(File sourceFile, String newPath) async { //ย้ายไฟล์ไปเก็บในโฟลเดอร์ที่กำหนด
    try {
      /// prefer using rename as it is probably faster
      /// if same directory path
      return await sourceFile.rename(newPath);
    } catch (e) {
      /// if rename fails, copy the source file 
      final newFile = await sourceFile.copy(newPath);
      return newFile;
    }
  }
