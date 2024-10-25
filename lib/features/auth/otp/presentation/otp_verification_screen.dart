// lib/presentation/screens/otp_verification_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/utiles/app_colors.dart';
import '../../../../core/utiles/assets.dart';
import 'cubit/otp_cubit.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final otpCubit = GetIt.I<OTPCubit>()..sendOTP(phoneNumber);
    print("phoneNumber: $phoneNumber");
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.c_001A3F,
            image: const DecorationImage(
              image: AssetImage(Assets.Login_Register_background),
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
          child: BlocProvider.value(
            value: otpCubit,
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
                const Text(
                  'Verification',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter the verification code sent to $phoneNumber',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
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
                  onCompleted: (otp) {
                    BlocProvider.of<OTPCubit>(context)
                        .verifyOTP('verificationId', otp);
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<OTPCubit, OTPState>(
                  listener: (context, state) {
                    if (state is OTPVerified) {
                      // Navigate to home screen
                    } else if (state is OTPError) {}
                  },
                  builder: (context, state) {
                    if (state is OTPLoading) {
                      //TODO: Add loading card here
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {},
                      child: const Text('Continue'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
