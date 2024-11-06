import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/services/di.dart';
import '../../../../core/services/secure_storage/secure_storage_service.dart';
import '../../../../core/utiles/app_colors.dart';
import '../../../../core/utiles/assets.dart';
import 'cubit/otp_cubit.dart';
import 'fake_home_scr.dart';
import 'widget/loading_dialog.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(phoneNumber);
    }

    return BlocProvider(
      create: (context) => s1<OTPCubit>(), //..sendOTP(phoneNumber),
      child: Scaffold(
        body: BlocListener<OTPCubit, OTPState>(
          listener: (context, state) {
            if (state is OTPVerified) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else if (state is OTPError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(AppStrings.otpError),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else if (state is OTPLoading) {
              showLoading(context);
            } else {
              Navigator.pop(context); // Close the loading dialog if it's open
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.c_001A3F,
              image: const DecorationImage(
                image: AssetImage(Assets.Login_Register_background),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    backgroundImage: AssetImage(Assets.assetsLogo),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.verification,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${AppStrings.enterVerificationCode} $phoneNumber',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<OTPCubit, OTPState>(
                    builder: (context, state) {
                      return PinCodeTextField(
                        appContext: context,
                        length: 6,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 60,
                          fieldWidth: 45,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.5),
                          selectedColor: Colors.white,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                        ),
                        enableActiveFill: true,
                        onChanged: (value) {},
                        onCompleted: (otp) async {
                          final otpCubit = BlocProvider.of<OTPCubit>(context);
                          final verificationId = await s1<
                                  SecureStorageService>()
                              .read(SecureStorageService
                                  .verificationIdCredential); // Retrieve it securely

                          otpCubit.verifyOTP(verificationId!, otp);
                          if (kDebugMode) {
                            print(
                                ' otp XxXxXxXxXxXxXx $otp XxXxXxXxXxXxXxXxXx otp');
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          s1<OTPCubit>().sendOTP(phoneNumber);
                        },
                        child: Text(
                          AppStrings.getcode,
                          style: TextStyle(color: AppColors.c_001A3F),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          context.go(AppRouter.kHomeScreen);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.white70),
                        ),
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
