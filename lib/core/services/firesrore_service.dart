import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/core/services/data_service.dart';
class FireStoreService implements DataBaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      // Use `set` with the user's UID as the document ID
      await firestore.collection(path).doc(data['uId']).set(data);
    } catch (e) {
      print('Error saving data to Firestore: $e');
      throw Exception('Failed to save data');
    }
  }
}