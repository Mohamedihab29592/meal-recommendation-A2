import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';

import 'firebase_network.dart';

class FirebaseNetworkServiceImpl implements FirebaseNetworkService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign In using email and password
  @override
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Sign Up using email and password
  @override
  Future<Either<FirebaseFailure, UserCredential>> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      }
      return left(FirebaseServerFailure(e.toString()));
    }
  }

  // Sign Out
  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  // Check if a user is signed in
  @override
  Future<bool> isUserSignedIn() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  // Create a document in Firestore
  @override
  Future<void> createDocument(
      String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);
    } catch (e) {
      throw Exception('Failed to create document: $e');
    }
  }

  // Get a document from Firestore
  @override
  Future<Map<String, dynamic>?> getDocument(
      String collection, String docId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection(collection).doc(docId).get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get document: $e');
    }
  }

  // Update a document in Firestore
  @override
  Future<void> updateDocument(
      String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(docId).update(data);
    } catch (e) {
      throw Exception('Failed to update document: $e');
    }
  }

  // Delete a document from Firestore
  @override
  Future<void> deleteDocument(String collection, String docId) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
    } catch (e) {
      throw Exception('Failed to delete document: $e');
    }
  }
}
