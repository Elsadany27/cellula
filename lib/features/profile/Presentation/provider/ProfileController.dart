import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends ChangeNotifier{
  String? urlimage;
  File? file;

  gettimage()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    file=File(image!.path);

    var imagename=basename(image.path);

    var refimage=FirebaseStorage.instance.ref("images/$imagename");
    await refimage.putFile(file!);
    urlimage=await refimage.getDownloadURL();
    notifyListeners();

    // setstate(){} important to show image
  }
}