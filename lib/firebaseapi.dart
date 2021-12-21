import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseApi{
  static UploadTask uploadFile(String destination, File file){
    try{
      final ref = FirebaseStorage.instance.ref(destination);
      Future<String> imageURL = ref.getDownloadURL();
      return ref.putFile(file);

    }on FirebaseException catch(e){
      return null;

    }
  }
}