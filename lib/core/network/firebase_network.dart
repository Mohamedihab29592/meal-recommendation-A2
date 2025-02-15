import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/errors/exception.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/entites/user_entity.dart';

abstract class AuthLogin {
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

abstract class CreateUserWithEmail {
  Future<Either<FirebaseFailure, UserCredential>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String profilePic,
    required String mobileNumber,
  });
  Future<Either<FirebaseFailure, UserCredential>> signInWithGoogle();
}

abstract class MealService {
  Stream<List<Meal>> getMeals();
  Stream<List<Meal>> getFavMeals();
  Future<Either<List<Meal>, FirebaseServerFailure>> changeFavourateStatus(String mealID);
  Future<Either<List<Meal>, FirebaseServerFailure>> modifyFavList(String mealID);
}
