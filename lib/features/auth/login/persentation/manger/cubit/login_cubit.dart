
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/data_source/data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginDataSource) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = false;

  final LoginDataSource loginDataSource;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    var res = await loginDataSource.signInWithEmail(
      email: email,
      password: password,
    );

    return res.fold(
      (fail) => emit(LoginError(fail.errMsg)),
      (success) => emit(LoginSuccess()),
    );
  }

  Future<void> googleSignIn() async {
    emit(GoogleSignInLoading());

    var res = await loginDataSource.signInWithGoogle();

    return res.fold(
      (fail) => emit(GoogleSignInError(fail.errMsg)),
      (user) => emit(GoogleSignInSuccess()),
    );
  }

  void toggleIcons() {
    showPassword = !showPassword;
    emit(LoginChangeIcons());
  }
}