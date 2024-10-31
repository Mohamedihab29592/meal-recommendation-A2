part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity userEntity;

  LoginSuccess({required this.userEntity});
}

class LogininFailure extends LoginState {
  final String message;

  LogininFailure({required this.message});
}
