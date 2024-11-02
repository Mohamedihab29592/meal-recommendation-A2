import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/core/services/data_service.dart';

class FireStoreService implements DataBaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> setData (
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }


}


