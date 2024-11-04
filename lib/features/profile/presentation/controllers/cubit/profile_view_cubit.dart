import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/domain/repo_interface/profile_repo.dart';

part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  ProfileViewCubit(this.profileRepo) : super(ProfileViewInitial());

  final ProfileRepo profileRepo;

  Future<void> updateImage() async {
    emit(ProfileViewLoading());
    var res = await profileRepo.updateImage();
    res.fold(
      (url) {
        emit(ProfileViewImageUpdated(url));
      },
      (exc) {
        emit(ProfileViewFailure(exc));
      },
    );
  }

  Future<void> getProfileData() async {
    emit(ProfileViewLoading());
    var res = await profileRepo.getProfileData();
    res.fold(
      (userModel) {
        emit(ProfileViewGetUserDataSuccess(userModel));
      },
      (exc) {
        emit(ProfileViewFailure(exc));
      },
    );
  }

  Future<void> updateProfileData(UserModel userModel) async {
    emit(ProfileViewLoading());
    var res = await profileRepo.updateProfileData(userModel);
    res.fold(
      (success) {
        emit(const ProfileViewSuccess("Profile Data Updated"));
      },
      (exc) {
        emit(ProfileViewFailure(exc));
      },
    );
  }

  Future<void> updatePassword(String newPassword) async {
    emit(ProfileViewLoading());
    var res = await profileRepo.updatePassword(newPassword);
    res.fold(
      (success) {
        emit(const ProfileViewSuccess("Password Updated"));
      },
      (exc) {
        emit(ProfileViewFailure(exc));
      },
    );
  }
}
