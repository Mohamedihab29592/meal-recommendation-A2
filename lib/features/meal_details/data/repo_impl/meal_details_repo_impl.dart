import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';
import 'package:meal_recommendations_a2/features/meal_details/domain/repo_interface/meal_details_repo.dart';

class MealDetailsRepoImpl extends MealDetailsRepo {
  MealDetailsRepoImpl({required this.secureStorageService, required this.firebaseNetworkService});

  final FirebaseNetworkService firebaseNetworkService;
  final SecureStorageService secureStorageService;

  @override
  Future<Either<MealDetailsModel, FirebaseServerFailure>> getMealDetailsModel(String mealID) async {
    try {
      String? uid = await secureStorageService.getUID();
      if (uid == null) {
        return right(FirebaseServerFailure("User not logged In"));
      }

      Map<String, dynamic>? res = await firebaseNetworkService.getDocument("users", uid);

      if (res!["meals"] == null || res["meals"].isEmpty) {
        return right(FirebaseServerFailure("No meals found"));
      }

      MealDetailsModel meal = MealDetailsModel.fromJson(res["meals"].elementAt(int.parse(mealID)), mealID);
      return left(meal);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return right(FirebaseServerFailure.fromFirebaseErr(e));
    } catch (e) {
      debugPrint(e.toString());
      return right(FirebaseServerFailure("Error, try again"));
    }
  }

  @override
  Future<Either<MealDetailsModel, FirebaseServerFailure>> changeFavourateStatus(String mealID) async {
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

      MealDetailsModel meal = MealDetailsModel.fromJson(meals[int.parse(mealID)], mealID);

      return left(meal);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return right(FirebaseServerFailure.fromFirebaseErr(e));
    } catch (e) {
      debugPrint(e.toString());
      return right(FirebaseServerFailure("Error, try again"));
    }
  }
}
