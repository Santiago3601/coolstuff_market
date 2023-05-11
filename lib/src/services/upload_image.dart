import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../dto/imageUploadState.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<ImageUploadState> uploadImage(File image) async {
  ImageUploadState res= new ImageUploadState(false,"");
  final String namefile = image.path.split("/").last;
  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String auditInfo = "${timestamp}";

  final String fileNameWithAudit = "${auditInfo}_${namefile}";
  print(fileNameWithAudit);
  res.setPath(fileNameWithAudit);
  Reference ref = storage.ref().child("images").child(fileNameWithAudit);

  final UploadTask uploadTask = ref.putFile(image);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

  if (snapshot.state == TaskState.success) {
    res.setState(true);
  } else {
    res.setState(false);
  }
  return res;
}
