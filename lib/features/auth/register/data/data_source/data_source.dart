import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/features/auth/register/data/model/user_model.dart';

class RegisterDataSource {
  final FirebaseNetworkService firebaseNetworkService;

  RegisterDataSource(this.firebaseNetworkService);

  Future<Either<FirebaseFailure, UserCredential>> signUpWithEmail({
    required String email,
    required String password,
    required String mobileNumber,
    required String profilePic,
    required String name,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      var user = await firebaseNetworkService.signUpWithEmail(
          mobileNumber: mobileNumber,
          name: name,
          profilePic: profilePic,
          email: email,
          password: password);
      User? currentUser = auth.currentUser;
      final String uId = currentUser!.uid;
      saveUserInfo(
        email: email,
        mobileNumber: mobileNumber,
        name: name,
        profilePic: profilePic,
        uId: uId,
      );
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
      final String uId = userCredential.user!.uid;
      if (userCredential.additionalUserInfo!.isNewUser) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .set(RegisterUserModel(
              email: userCredential.user!.email!,
              userName: userCredential.user!.displayName!,
              profilePic: userCredential.user!.photoURL!,
              mobileNumber: 'empty phone',
              uId: uId,
            ).toJson());
      }
      return right(userCredential);
    } catch (e) {
      return left(FirebaseServerFailure(e.toString()));
    }
  }

  void saveUserInfo({
    required String uId,
    required String email,
    required String name,
    required String mobileNumber,
    required String profilePic,
  }) {
    FirebaseFirestore.instance.collection('users').doc(uId).set(
          RegisterUserModel(
            userName: name,
            email: email,
            uId: uId,
            mobileNumber: mobileNumber,
            profilePic: profilePic,
          ).toJson(),
        );
  }
}
