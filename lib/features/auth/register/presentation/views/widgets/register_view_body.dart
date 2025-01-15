import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/features/auth/register/data/repo/repo_impl.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/manager/cubit/register_cubit.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_divider.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_indicator.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/widgets/custom_register_form_field.dart';
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
      create: (context) => RegisterCubit(RegisterRepoImpl()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegitserSuccess) {
            customSnackBar(context, AppStrings.registerSuccess);
            context.push(AppRouter.kHomeScreen);
          } else if (state is RegisterError) {
            customSnackBar(context, state.errMsg);
          } else if (state is GoogleSignInError) {
            customSnackBar(context, state.errMsg);
          } else if (state is GoogleSignInSuccess) {
            customSnackBar(context, AppStrings.registerSuccess);
            context.push(AppRouter.kLoginScreen);
          }
        },
        builder: (context, state) {
          var cubit = context.read<RegisterCubit>();
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.authBackground),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(Assets.logo),
                        const SizedBox(height: 20),
                        CustomRegisterFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.registerErrorEmpty;
                            }
                            return null;
                          },
                          controller: cubit.userNameController,
                          hintText: AppStrings.fullName,
                          preIcon: Icons.person_2_outlined,
                        ),
                        const SizedBox(height: 15),
                        CustomRegisterFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.registerEmpytEmail;
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                              return AppStrings.registerErrorEmail;
                            }
                            return null;
                          },
                          controller: cubit.emailController,
                          hintText: AppStrings.emailAddress,
                          preIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 15),
                        CustomRegisterFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.registerErrorEmpty;
                            }
                            return null;
                          },
                          controller: cubit.mobileNumberController,
                          hintText: AppStrings.mobileNumber,
                          preIcon: Icons.phone_android,
                        ),
                        const SizedBox(height: 15),
                        CustomRegisterFormField(
                          secureText: !cubit.showPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.registerEmpytPassword;
                            } else if (value.length < 6) {
                              return AppStrings.registerErrorPasswordLength;
                            }
                            return null;
                          },
                          controller: cubit.passwordController,
                          hintText: AppStrings.createPassword,
                          preIcon: Icons.lock_outline_rounded,
                          sufIcon: cubit.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          onPressedSufIcon: () {
                            cubit.toggleIcons();
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomRegisterFormField(
                          secureText: !cubit.showPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.registerErrorEmpty;
                            } else if (value != cubit.passwordController.text) {
                              return AppStrings.registerErrorPasswordMatch;
                            }
                            return null;
                          },
                          controller: cubit.confirmPasswordController,
                          hintText: AppStrings.confirmPassword,
                          preIcon: Icons.lock_outline_rounded,
                          sufIcon: cubit.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          onPressedSufIcon: () {
                            cubit.toggleIcons();
                          },
                        ),
                        const SizedBox(height: 20),
                        ConditionalBuilder(
                          condition: state is RegitserLoading,
                          builder: (context) => const CustomIndicator(),
                          fallback: (context) => CustomRegisterButton(
                            height: height,
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.regitserUser(
                                  mobileNumber: cubit.mobileNumberController.text,
                                  name: cubit.userNameController.text,
                                  profilePic:
                                      'https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3396.jpg',
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        const CustomDivider(),
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 10),
                        const LoginTextButton(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
