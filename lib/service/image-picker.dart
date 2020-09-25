import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future getImage(bool isCamera) async {
  File image;
  if (isCamera) {
    final PickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    image = File(PickedFile.path);
  } else {
    final PickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    image = File(PickedFile.path);
  }
  return image;
}
