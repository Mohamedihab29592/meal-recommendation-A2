import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';

class LoginDataSource {
  final FirebaseNetworkService firebaseNetworkService;

  LoginDataSource(this.firebaseNetworkService);

  Future<Either<FirebaseFailure, UserCredential>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseNetworkService.signInWithEmail(
          email: email, password: password);
      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      }
      return left(FirebaseServerFailure(e.toString()));
    }
  }

  Future<Either<FirebaseFailure, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return right(userCredential);
    } catch (e) {
      return left(FirebaseServerFailure(e.toString()));
    }
  }
}