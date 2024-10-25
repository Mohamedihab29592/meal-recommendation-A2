import '../otp_repository/otp_repository.dart';

class VerifyOTP {
  final OTPRepository repository;

  VerifyOTP(this.repository);

  Future<void> call({required String verificationId, required String otp}) {
    return repository.verifyOTP(verificationId: verificationId, otp: otp);
  }
}
