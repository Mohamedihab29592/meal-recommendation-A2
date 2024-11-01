abstract class OTPRepository {
  Future<void> sendOTP({required String phoneNumber});
  Future<void> verifyOTP({required String verificationId, required String otp});
}
