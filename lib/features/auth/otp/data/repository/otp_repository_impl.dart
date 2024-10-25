// lib/data/repositories/otp_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/otp_repository/otp_repository.dart';

class OTPRepositoryImpl implements OTPRepository {
  final FirebaseAuth firebaseAuth;

  OTPRepositoryImpl({required this.firebaseAuth});

  @override
  Future<void> sendOTP({required String phoneNumber}) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("xxxxxxxxxxxx ${credential.smsCode}");
        await firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        throw e.message ?? 'Error occurred during phone verification';
      },
      codeSent: (String verificationId, int? resendToken) {
        //  Handle the verification Id.
        print(' verificationId $verificationId');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<UserCredential> verifyOTP(
      {required String verificationId, required String otp}) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    return await firebaseAuth.signInWithCredential(credential);
  }
}
