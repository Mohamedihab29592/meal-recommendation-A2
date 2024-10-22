import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';

class RegisterDataSource {
  final FirebaseNetworkService firebaseNetworkService;

  RegisterDataSource(this.firebaseNetworkService);

  Future<Either<FirebaseFailure, UserCredential>> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await firebaseNetworkService.signUpWithEmail(
          email: email, password: password);
      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      }
      return left(FirebaseServerFailure(e.toString()));
    }
  }
}
