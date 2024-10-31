import 'package:either_dart/either.dart';
import 'package:meal_recommendations_a2/core/errors/exception.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/entites/user_entity.dart';

abstract class AutoLogin{
  Future<Either<Failure,UserEntity>> signInWithEmail(String email, String password);
  Future<Either<Failure,UserEntity>> signInWithGoogle();
  
  Future setUserData({required UserEntity userEntity});

}