import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
import '../../../core/helper/meal_helper.dart';

class FirestoreService implements MealService {
  const FirestoreService(this.secureStorageService);

  final SecureStorageService secureStorageService;

  @override
  Stream<List<Meal>> getMeals() {
    return FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots().map((snapshot) {
      final mealData = snapshot.data();
      final meals = (mealData!['meals'] as List<dynamic>);
      final List<Meal> allMeals = [];
      for (int i = 0; i < meals.length; i++) {
        allMeals.add(Meal.fromMap(meals[i] as Map<String, dynamic>, i.toString()));
      }
      return allMeals;
    });
  }

  @override
  Future<Either<List<Meal>, FirebaseServerFailure>> changeFavourateStatus(String mealID) async {
    try {
      String? uid = await secureStorageService.getUID();
      if (uid == null) {
        return right(FirebaseServerFailure("User not logged In"));
      }

      DocumentReference<Map<String, dynamic>> documentRef = FirebaseFirestore.instance.collection('users').doc(uid);
      DocumentSnapshot<Map<String, dynamic>> snapshot = await documentRef.get();
      List<dynamic> meals = snapshot.data()?['meals'] ?? [];
      meals[int.parse(mealID)]['isFav'] = !meals[int.parse(mealID)]['isFav'];
      await documentRef.update({'meals': meals});

      List<Meal> allMeals = [];
      for (int i = 0; i < snapshot.data()?["meals"].length; i++) {
        allMeals.add(Meal.fromMap(snapshot.data()?["meals"][i], i.toString()));
      }
      return left(allMeals);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return right(FirebaseServerFailure.fromFirebaseErr(e));
    } catch (e) {
      debugPrint(e.toString());
      return right(FirebaseServerFailure("Error, try again"));
    }
  }
}
