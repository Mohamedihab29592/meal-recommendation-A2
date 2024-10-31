import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/domain/repo_interface/profile_repo.dart';

part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  ProfileViewCubit(this.profileRepo) : super(ProfileViewInitial());

  final ProfileRepo profileRepo;

  Future<void> pickImage() async {
    emit(ProfileViewLoading());
    var res = await profileRepo.pickImage();
    res.fold(
      (left) {
        emit(ProfileViewSuccess());
      },
      (right) {
        emit(ProfileViewFailure(right));
      },
    );
  }

  Future<void> getProfileData() async {
    emit(ProfileViewLoading());
    var res = await profileRepo.getProfileData();
    res.fold(
      (left) {
        emit(ProfileViewGetUserDataSuccess(left));
      },
      (right) {
        emit(ProfileViewFailure(right));
      },
    );
  }

  Future<void> updateProfileData(UserModel userModel) async {
    emit(ProfileViewLoading());
    var res = await profileRepo.updateProfileData(userModel);
    res.fold(
      (left) {
        emit(ProfileViewSuccess());
      },
      (right) {
        emit(ProfileViewFailure(right));
      },
    );
  }

  Future<void> updatePassword(String newPassword) async {
    emit(ProfileViewLoading());
    var res = await profileRepo.updatePassword(newPassword);
    res.fold(
      (left) {
        emit(ProfileViewSuccess());
      },
      (right) {
        emit(ProfileViewFailure(right));
      },
    );
  }
}
