// lib/presentation/cubit/otp_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

part 'otp_state.dart';

class OTPCubit extends Cubit<OTPState> {
  final SendOTP sendOTPUseCase;
  final VerifyOTP verifyOTPUseCase;

  OTPCubit({required this.sendOTPUseCase, required this.verifyOTPUseCase})
      : super(OTPInitial());

  void sendOTP(String phoneNumber) async {
    //emit(OTPLoading());
    try {
      await sendOTPUseCase(phoneNumber: phoneNumber);
      emit(OTPCodeSent());
    } catch (e) {
      emit(OTPError(e.toString()));
    }
  }

  void verifyOTP(String verificationId, String otp) async {
    emit(OTPLoading());
    try {
      await verifyOTPUseCase(verificationId: verificationId, otp: otp);

      emit(OTPVerified());
    } catch (e) {
      emit(OTPError(e.toString()));
    }
  }
}
