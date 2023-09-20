import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseStorageService._();

  static FirebaseStorage instance = FirebaseStorage.instance;

  static Future<String> getImageByName(String filename) {
    return instance.ref(filename).getDownloadURL();
  }
}
