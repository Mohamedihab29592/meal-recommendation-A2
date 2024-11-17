import 'package:dartz/dartz.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';

abstract class MealDetailsRepo {
  Future<Either<MealDetailsModel, FirebaseServerFailure>> getMealDetailsModel(String mealID);
}
