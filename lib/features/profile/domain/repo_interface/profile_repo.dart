import 'package:dartz/dartz.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<String, FirebaseServerFailure>> updateImage();
  Future<void> deleteImage();
  Future<Either<UserModel, FirebaseServerFailure>> getProfileData();
  Future<Either<void, FirebaseServerFailure>> updateProfileData(UserModel userModel);
  Future<Either<void, FirebaseServerFailure>> updatePassword(String newPassword);
}
