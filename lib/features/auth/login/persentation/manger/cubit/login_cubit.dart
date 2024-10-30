import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/data_source/data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginDataSource) : super(LoginInitial());

  final LoginDataSource loginDataSource;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = false;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await loginDataSource.signInWithEmail(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginError(failure.errMsg)),
      (userCredential) async {
        final uid = userCredential.user?.uid; // Get UID from UserCredential
        if (uid != null) {
          await _saveUid(uid);
          emit(LoginSuccess());
        } else {
          emit(LoginError("UID not found."));
        }
      },
    );
  }

  Future<void> googleSignIn() async {
    emit(GoogleSignInLoading());

    final result = await loginDataSource.signInWithGoogle();

    result.fold(
      (failure) => emit(GoogleSignInError(failure.errMsg)),
      (userCredential) async {
        final uid = userCredential.user?.uid; // Get UID from UserCredential
        if (uid != null) {
          await _saveUid(uid);
          emit(GoogleSignInSuccess());
        } else {
          emit(GoogleSignInError("UID not found."));
        }
      },
    );
  }

  Future<void> _saveUid(String uid) async {
    try {
      await secureStorage.write(key: 'uid', value: uid);
      print('UID successfully saved: $uid'); // Debug print
    } catch (e) {
      print('Failed to save UID: $e'); // Debug print for errors
    }
  }

  void toggleIcons() {
    showPassword = !showPassword;
    emit(LoginChangeIcons());
  }
}
