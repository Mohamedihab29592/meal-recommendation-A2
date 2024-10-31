part of 'profile_view_cubit.dart';

sealed class ProfileViewState extends Equatable {
  const ProfileViewState();

  @override
  List<Object> get props => [];
}

final class ProfileViewInitial extends ProfileViewState {}

final class ProfileViewLoading extends ProfileViewState {}

final class ProfileViewSuccess extends ProfileViewState {}

final class ProfileViewGetUserDataSuccess extends ProfileViewState {
  final UserModel userModel;

  const ProfileViewGetUserDataSuccess(this.userModel);
}

final class ProfileViewFailure extends ProfileViewState {
  const ProfileViewFailure(this.error);

  final FirebaseServerFailure error;
}
