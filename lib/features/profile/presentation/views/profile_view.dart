import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/helper/snack_bar.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/custom_button.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/text_fields_section.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/profile_view_header.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/controllers/cubit/profile_view_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController passwordController;
  late UserModel userModel;
  late bool isLoading;
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    userModel = UserModel.initState();
    isLoading = true;
    userNameController = TextEditingController(text: userModel.userName);
    emailController = TextEditingController(text: userModel.email);
    phoneController = TextEditingController(text: userModel.phone);
    passwordController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<ProfileViewCubit>(context).getProfileData();
    });

    return BlocConsumer<ProfileViewCubit, ProfileViewState>(
      listener: (context, state) {
        if (state is ProfileViewLoading) {
          isLoading = true;
          return;
        } else if (state is ProfileViewGetUserDataSuccess) {
          userModel = state.userModel;
          userNameController.text = userModel.userName;
          emailController.text = userModel.email;
          phoneController.text = userModel.phone;
        } else if (state is ProfileViewSuccess) {
          showSnackBar(context, state.message);
        } else if (state is ProfileViewImageUpdated) {
          userModel.profileURL = state.profileURL;
        } else if (state is ProfileViewFailure) {
          showSnackBar(context, state.error.errMsg);
        }
        isLoading = false;
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const ProfileViewHeader(),
                          const SizedBox(height: 10),
                          ProfileViewImage(url: userModel.profileURL),
                          const SizedBox(height: 10),
                          TextFieldsSection(
                            userModel: userModel,
                            userNameController: userNameController,
                            emailController: emailController,
                            phoneController: phoneController,
                            passwordController: passwordController,
                          ),
                          const Expanded(child: SizedBox(height: 10)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CustomButton(
                              text: AppStrings.saveButton,
                              foregroundColor: Colors.white,
                              backgroundColor: AppColors.c001A3F,
                              radius: 14,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  bool dataIsNotChanged = !dataIsChanged(userModel, userNameController, emailController, phoneController);
                                  formKey.currentState!.save();
                                  if (dataIsNotChanged) {
                                    await BlocProvider.of<ProfileViewCubit>(context).updateProfileData(userModel);
                                  }
                                  if (passwordController.text.isNotEmpty) {
                                    if (context.mounted) {
                                      await BlocProvider.of<ProfileViewCubit>(context).updatePassword(passwordController.text);
                                    }
                                  }
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                          const Expanded(child: SizedBox(height: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool dataIsChanged(
    UserModel userModel,
    TextEditingController userNameController,
    TextEditingController emailController,
    TextEditingController phoneController,
  ) {
    return userModel.userName == userNameController.text && userModel.email == emailController.text && userModel.phone == phoneController.text;
  }
}
