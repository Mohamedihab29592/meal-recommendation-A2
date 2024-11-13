import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
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

      Map<String, dynamic>? res = await firebaseNetworkService.getDocument("meals", uid);

      if (res!["meals"] == null || res["meals"].isEmpty) {
        return right(FirebaseServerFailure("No meals found"));
      }

      MealDetailsModel meal = MealDetailsModel.fromJson(res["meals"].elementAt(int.parse(mealID)));
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
