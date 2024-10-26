import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/helper/preferences_helper.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_button.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_text_field.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/logo_widget.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/or_divider.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/password_text_field.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/manger/cubit/login_cubit.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/remember_me.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsAccepted = false;

  @override
  void initState() {
    super.initState();
    _checkIfRemembered();
  }

  // Check if the user has previously accepted the terms and conditions
  void _checkIfRemembered() async {
    bool isAccepted = await PreferencesHelper.getTermsAccepted();
    if (isAccepted) {
      // Navigate to home page if terms are accepted
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const boxDecoration = BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.background),
            fit: BoxFit.cover,
          ),
        );
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: boxDecoration,
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            top: screenHeight * 0.10,
            bottom: screenHeight * 0.02,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoWidget(),
                  const SizedBox(height: 75),
                  CustomTextField(
                    hintText: 'Email',
                    iconPath: Assets.accountIcon,
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomPasswordField(
                    hintText: 'Password',
                    iconPath: Assets.lockIcon,
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  RememberMe(
                    onChanged: (value) {
                      setState(() {
                        isTermsAccepted = value;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<LoginCubit>().loginUser(email: email, password: password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 33),
                  Column(
                    children: [
                      const OrDivider(),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.read<LoginCubit>().googleSignIn();
                              },
                              icon: Image.asset(
                                Assets.googleIcon,
                                height: screenHeight * 0.05,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 33),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? Register now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}