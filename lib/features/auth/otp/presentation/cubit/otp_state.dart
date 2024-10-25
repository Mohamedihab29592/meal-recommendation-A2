part of 'otp_cubit.dart';

abstract class OTPState extends Equatable {
  const OTPState();

  @override
  List<Object?> get props => [];
}

class OTPInitial extends OTPState {}

class OTPLoading extends OTPState {}

class OTPCodeSent extends OTPState {}

class OTPVerified extends OTPState {}

class OTPError extends OTPState {
  final String message;

  OTPError(this.message);

  @override
  List<Object?> get props => [message];
}
