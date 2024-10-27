import '../otp_repository/otp_repository.dart';

class SendOTP {
  final OTPRepository repository;

  SendOTP(this.repository);

  Future<void> call({required String phoneNumber}) {
    return repository.sendOTP(phoneNumber: phoneNumber);
  }
}
