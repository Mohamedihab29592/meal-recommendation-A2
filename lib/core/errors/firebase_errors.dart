import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseFailure {
  final String errMsg;

  FirebaseFailure(this.errMsg);
}

class FirebaseServerFailure extends FirebaseFailure {
  FirebaseServerFailure(super.errMsg);

  factory FirebaseServerFailure.fromFirebaseErr(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return FirebaseServerFailure('The password provided is too weak');
      case 'email-already-in-use':
        return FirebaseServerFailure(
            'The account already exists for that email');
      default:
        return FirebaseServerFailure(e.message.toString());
    }
  }
}
