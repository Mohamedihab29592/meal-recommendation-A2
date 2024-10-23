import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/auth/register/data/data_source/data_source.dart';

part 'regitser_state.dart';

class RegitserCubit extends Cubit<RegitserState> {
  RegitserCubit(this.registerDataSource) : super(RegitserInitial());
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = false;

  final RegisterDataSource registerDataSource;
  Future<void> regitserUser(
      {required String email, required String password}) async {
    emit(RegitserLoading());
    var res = await registerDataSource.signUpWithEmail(
      email: email,
      password: password,
    );
    return res.fold(
      (fail) => emit(RegitserError(fail.errMsg)),
      (success) => emit(RegitserSuccess()),
    );
  }

  Future<void> googleSignIn() async {
    emit(GoogleSignInLoading());

    var res = await registerDataSource.signInWithGoogle();

    return res.fold(
      (fail) => emit(GoogleSignInError(fail.errMsg)),
      (user) => emit(GoogleSignInSuccess()),
    );
  }

  void toggleIcons() {
    showPassword = !showPassword;
    emit(RegitserChangeIcons());
  }
}
