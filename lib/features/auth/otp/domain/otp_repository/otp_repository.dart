import 'package:firebase_auth/firebase_auth.dart';

abstract class OTPRepository {
  Future<void> sendOTP({required String phoneNumber});
  Future<UserCredential> verifyOTP(
      {required String verificationId, required String otp});
}
