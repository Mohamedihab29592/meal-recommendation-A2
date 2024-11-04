import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meal_recommendations_a2/core/utiles/constant.dart';
import 'package:meal_recommendations_a2/core/helper/create_file_path.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';

class FirebaseStorageServices {
  FirebaseStorageServices({required this.firebaseNetworkService});

  final FirebaseNetworkService firebaseNetworkService;

  Future<void> remFromFirebaseStorage(String url, String userUID) async {
    await FirebaseStorage.instance.refFromURL(url).delete();
    await firebaseNetworkService.updateDocument("users", userUID, {UserModel.profileURLKey: defaultProfileImageURL});
  }

  Future<String> storeInFirebaseStorage(File file, String uId) async {
    final Reference ref = FirebaseStorage.instance.ref(createFilePath(file, uId));
    await ref.putFile(file);
    String url = await ref.getDownloadURL();
    return url;
  }
}
