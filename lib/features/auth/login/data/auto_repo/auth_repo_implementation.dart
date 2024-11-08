import 'package:dartz/dartz.dart';
import 'package:meal_recommendations_a2/core/errors/exception.dart';
import 'package:meal_recommendations_a2/core/network/firebase_auth_services.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/core/services/data_service.dart';
import 'package:meal_recommendations_a2/core/utiles/backend_endpoint.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/entites/user_entity.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/model/user_model.dart';

class AuthRepoImplementation extends AuthLogin {
  final FirebaseServices firebaseServices;
  final DataBaseServices dataBaseServices;

  AuthRepoImplementation({
    required this.dataBaseServices,
    required this.firebaseServices,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(String email, String password) async {
    try {
      var user = await firebaseServices.signInWithEmail(email: email, password: password);
      return Right(UserModel.fromFirestore(user));
    } on Exception catch (e) {
      return Left(ServerFailure('An error occurred. Please try again.'));
    } catch (e) {
      return Left(ServerFailure('An error occurred. Please try again.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseServices.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirestore(user);

      // Save the user data to Firestore
      await setUserData(userEntity: userEntity);

      return Right(userEntity);
    } on Exception catch (e) {
      return Left(ServerFailure('An error occurred. Please try again.'));
    } catch (e) {
      return Left(ServerFailure('An error occurred. Please try again.'));
    }
  }

  @override
  Future<void> setUserData({required UserEntity userEntity}) async {
    await dataBaseServices.setData(
      path: BackendEndpoint.setUserData,
      data: userEntity.toMap(),
    );
  }
}
