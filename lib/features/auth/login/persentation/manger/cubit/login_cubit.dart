import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/entites/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthLogin authRepo;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> signin(String email, String password) async {
    emit(LoginLoading());

    final result = await authRepo.signInWithEmail(email, password);
    result.fold(
      (failure) => emit(LogininFailure(message: failure.message)),
      (userEntity) async {
        await _saveUid(userEntity.uId);
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> signinWithGoogle() async {
    emit(LoginLoading());

    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LogininFailure(message: failure.message)),
      (userEntity) async {
        await _saveUid(userEntity.uId);
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> _saveUid(String uid) async {
    try {
      await secureStorage.write(key: 'uid', value: uid);
      debugPrint('UID successfully saved: $uid'); // Debug print
    } catch (e) {
      debugPrint('Failed to save UID: $e'); // Debug print for errors
    }
  }
}