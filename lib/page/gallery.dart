
import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as path;

class Gallery extends StatefulWidget {
  const Gallery({
    Key key,
    this.title = 'Chewie Demo',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _GalleryState();
  }
}

class _GalleryState extends State<Gallery> {
  TargetPlatform _platform;
   VideoPlayerController _videoPlayerController1;
    ChewieController _chewieController;
     static final Directory _photoDir =
      new Directory('/storage/emulated/0/Android/data/com.rmutt.cpe.project.helmet_detection_app/files/Video');
 
  @override
  void initState() {
    super.initState();
      /* initializePlayer();  */
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  } 
 
  @override
  Widget build(BuildContext context) {
     List<FileSystemEntity> _photoList;
      Directory _downloadsDirectory;

    Widget buildPhoto(int index) {
      
    Future<Widget> initializePlayer(index) async {
    _videoPlayerController1 =  VideoPlayerController.file(_photoList[index]);
    try{
      await Future.wait([
      _videoPlayerController1.initialize()
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
    );}
    catch(e){return null;}
    return Center();
    
    }

    deleteFile(index) async {///ลบไฟล์วิดีโอ
        try {
          await _photoList[index].delete();
          Navigator.pop(context, 'OK');
        } catch (e) {
          return 0;
        }
        setState(() {
          
        });
      }

     download(index) async {///โหลดวิดีโอ
       /* var status = await Permission.storage.status;
           if (status.isUndetermined) {
                // You can request multiple permissions at once.
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                  Permission.camera,
                ].request();
                print(statuses[Permission.storage]); // it should print PermissionStatus.granted
              } */
         try {
      Directory appDocDir = await getTemporaryDirectory();
      String appDocPath = appDocDir.path;
      print(appDocPath);
      String pathDownload = await ExtStorage.getExternalStoragePublicDirectory(
      ExtStorage.DIRECTORY_PICTURES);
      var basNameWithExtension = path.basename(_photoList[index].path);
      Navigator.pop(context, 'OK');
      setState(() {
          
        });
      /* return await _photoList[index].rename("/storage/emulated/0/Download"+"/"+basNameWithExtension); */
    } catch (e) {
      return 0;
    }
      }

    

    if (index >= _photoList.length) {
        return null;
      }
    print('Loading video[$index]: ${_photoList[index]}... done');
    return GestureDetector(
      child: Center(
                child: Card(
                child: Column(
                  children: [
                    FutureBuilder<Widget>(
                           future: initializePlayer(index),
                           builder: (context, snapshot) => (_chewieController != null &&
                        _chewieController.videoPlayerController.value.isInitialized
                    ? Chewie(
                        controller: _chewieController,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Loading'),
                        ],
                      )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () => showDialog<String>(
                    context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('You confirm to download?'),
          //content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel',style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () =>  download(index),
              child: const Text('OK',style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
                  ), icon: Icon(Icons.download)),
                SizedBox(width: 250),
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
      ), icon: Icon(Icons.restore_from_trash,color: Colors.red,)),
                ],
              )
                  ],
                )
    )));
    }

    Widget buildPhotoList() {
      _photoList = _photoDir.listSync();
      return new ListView.builder(
        itemBuilder: (BuildContext context, int index) => buildPhoto(index)
      );
    }

    return new Scaffold(
      appBar: AppBar(),
      body: new Center(
        child: new Align(
          alignment: Alignment.topCenter,
          child: buildPhotoList(),
        ),
      ),
    );
  }
}