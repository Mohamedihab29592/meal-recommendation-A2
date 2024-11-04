part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class GoogleSignInSuccess extends RegisterState {}

final class GoogleSignInLoading extends RegisterState {}

final class GoogleSignInError extends RegisterState {
  final String errMsg;

  const GoogleSignInError(this.errMsg);
}

final class RegisterChangeIcons extends RegisterState {}

final class RegisterError extends RegisterState {
  final String errMsg;

  const RegisterError(this.errMsg);
}
