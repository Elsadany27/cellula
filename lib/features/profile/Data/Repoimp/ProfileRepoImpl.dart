import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:stylish/features/profile/Domain/Repo/ProfileRepo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepoImpl extends ProfileRepo{
  String? urlimage;
  File? file;
  @override
  getimage() async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    file=File(image!.path);

    var imagename=basename(image.path);

    var refimage=FirebaseStorage.instance.ref("images cellula/$imagename");
    await refimage.putFile(file!);
    urlimage=await refimage.getDownloadURL();
  }
}