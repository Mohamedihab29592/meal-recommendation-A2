part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegitserLoading extends RegisterState {}

final class RegitserSuccess extends RegisterState {}

final class GoogleSignInSuccess extends RegisterState {}

final class GoogleSignInLoading extends RegisterState {}

final class GoogleSignInError extends RegisterState {
  final String errMsg;

  const GoogleSignInError(this.errMsg);
}

final class RegitserChangeIcons extends RegisterState {}

final class RegisterError extends RegisterState {
  final String errMsg;

  const RegisterError(this.errMsg);
}
