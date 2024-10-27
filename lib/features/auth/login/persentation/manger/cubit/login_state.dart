part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class GoogleSignInSuccess extends LoginState {}

final class GoogleSignInLoading extends LoginState {}

final class GoogleSignInError extends LoginState {
  final String errMsg;

  GoogleSignInError(this.errMsg);
}

final class LoginChangeIcons extends LoginState {}

final class LoginError extends LoginState {
  final String errMsg;

  LoginError(this.errMsg);
}