import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';

part 'regitser_state.dart';

class RegitserCubit extends Cubit<RegitserState> {
  RegitserCubit(this.createUserWithEmail) : super(RegitserInitial());
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = false;

  final CreateUserWithEmail createUserWithEmail;
  Future<void> regitserUser({
    required String email,
    required String password,
    required String mobileNumber,
    required String profilePic,
    required String name,
  }) async {
    emit(RegitserLoading());
    var res = await createUserWithEmail.signUpWithEmail(
      email: email,
      mobileNumber: mobileNumber,
      name: name,
      profilePic: profilePic,
      password: password,
    );
    return res.fold(
      (fail) => emit(RegitserError(fail.errMsg)),
      (success) => emit(RegitserSuccess()),
    );
  }

  Future<void> googleSignIn() async {
    emit(GoogleSignInLoading());

    var res = await createUserWithEmail.signInWithGoogle();

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
