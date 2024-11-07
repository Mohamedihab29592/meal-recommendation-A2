import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/errors/exception.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/entites/user_entity.dart';

abstract class AutoLogin {
  Future<Either<Failure, UserEntity>> signInWithEmail(String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future setUserData({required UserEntity userEntity});
}

abstract class FirebaseNetworkService {
  // Authentication methods
  Future<Either<FirebaseFailure, UserCredential>> signInWithEmail({required String email, required String password});
  Future<Either<FirebaseFailure, UserCredential>> signUpWithEmail({required String email, required String password});
  Future<void> signOut();
  Future<bool> isUserSignedIn();

  // Firestore data operations
  Future<void> createDocument(String collection, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getDocument(String collection, String docId);
  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data);
  Future<void> deleteDocument(String collection, String docId);
}

abstract class MealService {
  Stream<List<Meal>> getMeals();
}
// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<List<Meal>> getMeals() {
//     return _firestore.collection('meals').snapshots().map((snapshot) {
//       final mealDocs = snapshot.docs;
//       if (mealDocs.isNotEmpty) {
//         final mealData = mealDocs[0].data() as Map<String, dynamic>;
//         final meals = (mealData['meals'] as List<dynamic>)
//             .map((meal) => Meal.fromMap(meal as Map<String, dynamic>))
//             .toList();
//         return meals;
//       }
//       return [];
//     });
//   }
// }