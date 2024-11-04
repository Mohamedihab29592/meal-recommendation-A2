import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_recommendations_a2/core/errors/exception.dart';


class FirebaseServices {
  Future<User> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Excpetion in FirebaseServices.signInWithEmailAndPassword ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomeException(message: 'البريد الالكترونى او كلمه السر غير صحيحه' );
      } else if (e.code == 'wrong-password') {
        throw CustomeException( message: 'البريد الالكترونى او كلمه السر غير صحيحه'  );
      }
      else if(e.code =='network-request-failed'){
       throw CustomeException(message: 'تاكد من الاتصال بالانترنت');
      }
      else{
      throw CustomeException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
        }
    catch (e) {
    log("Excpetion in FirebaseServices.signInWithEmailAndPassword");
      throw CustomeException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
      }
    Future<User> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
}


}
