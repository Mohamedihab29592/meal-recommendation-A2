import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';

abstract class FirebaseNetworkService {
  // Authentication methods
  Future<Either<FirebaseFailure, UserCredential>> signInWithEmail(
      {required String email, required String password});
  Future<Either<FirebaseFailure, UserCredential>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String profilePic,
    required String mobileNumber,
  });
  Future<void> signOut();
  Future<bool> isUserSignedIn();

  // Firestore data operations
  Future<void> createDocument(String collection, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getDocument(String collection, String docId);
  Future<void> updateDocument(
      String collection, String docId, Map<String, dynamic> data);
  Future<void> deleteDocument(String collection, String docId);
}
