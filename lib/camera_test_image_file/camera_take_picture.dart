import 'package:image_picker/image_picker.dart';
import 'dart:io';

final picker = ImagePicker();
File image;

Future getImage() async {
  final PickedFile pickedFile =
      await picker.getImage(source: ImageSource.camera);
  if (pickedFile != null) {
    print('Take image to dir');
    image = File(pickedFile.path);
  } else {
    print('No image seleted.');
  }
}
