import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network_impl.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/features/auth/register/data/data_source/data_source.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/manager/regitser_cubit/regitser_cubit.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_divider.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_indicator.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_register_form_field.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_regitser_button.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_snack_bar.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/google_button.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/login_text_button.dart';

import '../../../../../../core/utiles/app_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) =>
          RegitserCubit(RegisterDataSource(FirebaseNetworkServiceImpl())),
      child: BlocConsumer<RegitserCubit, RegitserState>(
        listener: (context, state) {
          if (state is RegitserSuccess || state is GoogleSignInSuccess) {
            customSnackBar(context, AppStrings.registerSuccess);
            context.push(AppRouter.kOtpScreen);
          } else if (state is RegitserError) {
            customSnackBar(context, state.errMsg);
          } else if (state is GoogleSignInError) {
            customSnackBar(context, state.errMsg);
          }
        },
        builder: (context, state) {
          var cubit = context.read<RegitserCubit>();
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset(
                fit: BoxFit.fill,
                width: double.infinity,
                Assets.assetsRegisterBackground,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26, right: 25, left: 25),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.assetsLogo,
                        ),
                        SizedBox(
                          height: height * 0.031,
                        ),
                        CustomRegisterFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.registerErrorEmpty;
                            }
                            return null;
                          },
                          controller: cubit.userNameController,
                          hintText: 'Full name',
                          preIcon: Icons.person_2_outlined,
                        ),
                        SizedBox(
                          height: height * 0.022,
                        ),
                        CustomRegisterFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          controller: cubit.emailController,
                          hintText: 'email address',
                          preIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: height * 0.022,
                        ),
                        CustomRegisterFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.registerErrorEmpty;
                            }
                            return null;
                          },
                          controller: cubit.mobileNumberController,
                          hintText: 'Mobile number',
                          preIcon: Icons.phone_android,
                        ),
                        SizedBox(
                          height: height * 0.022,
                        ),
                        CustomRegisterFormField(
                          secureText: !cubit.showPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return AppStrings.registerErrorPasswordLength;
                            }
                            return null;
                          },
                          controller: cubit.passwordController,
                          hintText: 'Create password',
                          preIcon: Icons.lock_outline_rounded,
                          sufIcon: cubit.showPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onPressedSufIcon: () {
                            cubit.toggleIcons();
                          },
                        ),
                        SizedBox(
                          height: height * 0.022,
                        ),
                        CustomRegisterFormField(
                          secureText: !cubit.showPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != cubit.passwordController.text) {
                              return AppStrings.registerErrorPasswordMatch;
                            }
                            return null;
                          },
                          controller: cubit.confirmPasswordController,
                          hintText: 'Confirm password',
                          preIcon: Icons.lock_outline_rounded,
                          sufIcon: cubit.showPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onPressedSufIcon: () {
                            cubit.toggleIcons();
                          },
                        ),
                        SizedBox(
                          height: height * 0.045,
                        ),
                        ConditionalBuilder(
                          condition: state is RegitserLoading,
                          builder: (context) => const CustomIndicator(),
                          fallback: (context) => CustomRegisterButton(
                            height: height,
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.regitserUser(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.023,
                        ),
                        const CustomDivider(),
                        SizedBox(
                          height: height * 0.023,
                        ),
                        ConditionalBuilder(
                          condition: state is GoogleSignInLoading,
                          builder: (context) => const CustomIndicator(),
                          fallback: (context) => GoogleButton(
                            height: height,
                            onTap: () {
                              cubit.googleSignIn();
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.019,
                        ),
                        const LoginTextButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
