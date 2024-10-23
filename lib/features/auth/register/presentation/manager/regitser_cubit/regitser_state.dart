part of 'regitser_cubit.dart';

@immutable
sealed class RegitserState {}

final class RegitserInitial extends RegitserState {}

final class RegitserLoading extends RegitserState {}

final class RegitserSuccess extends RegitserState {}

final class GoogleSignInSuccess extends RegitserState {}

final class GoogleSignInLoading extends RegitserState {}

final class GoogleSignInError extends RegitserState {
  final String errMsg;

  GoogleSignInError(this.errMsg);
}

final class RegitserChangeIcons extends RegitserState {}

final class RegitserError extends RegitserState {
  final String errMsg;

  RegitserError(this.errMsg);
}
