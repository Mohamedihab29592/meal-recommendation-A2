import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/services/secure_storage/secure_storage_service.dart';
import '../../domain/otp_repository/otp_repository.dart';

class OTPRepositoryImpl implements OTPRepository {
  final FirebaseAuth firebaseAuth;
  final SecureStorageServicee secureStorageService;

  OTPRepositoryImpl(
      {required this.firebaseAuth, required this.secureStorageService}) {
    firebaseAuth.setSettings(
      forceRecaptchaFlow: true,
    );
    firebaseAuth.setLanguageCode('en');
  }

  @override
  Future<void> sendOTP({required String phoneNumber}) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          if (kDebugMode) {
            print("Verification completed: ${credential.smsCode}");
          }
          await firebaseAuth.signInWithCredential(credential);

          // Store accessToken if available
          if (credential.accessToken != null) {
            await secureStorageService.write(
                'accessToken', credential.accessToken!);
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(
              e.message ?? 'Error occurred during phone verification');
        },
        codeSent: (String verificationId, int? resendToken) async {
          if (kDebugMode) {
            print('Code sent: verificationId $verificationId');
          }
          await secureStorageService.write('verificationId', verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (kDebugMode) {
            print('Auto retrieval timeout for verificationId: $verificationId');
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to send OTP: $e');
      }
      rethrow;
    }
  }

  @override
  Future<void> verifyOTP({
    required String verificationId,
    required String otp,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      // final  credentialToken = credential.token;

      // final userCredential =
      //     await firebaseAuth.signInWithCredential(credential);

      // Save the access token securely if available
      if (credential.accessToken != null) {
        await secureStorageService.write(
            'accessToken', credential.accessToken!);
      }
      // return userCredential;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to verify OTP: $e');
      }
      throw Exception('Verification failed: ${e.toString()}');
    }
  }

  // Retrieve stored verificationId and accessToken
  Future<String?> getStoredVerificationId() async {
    return await secureStorageService.read('verificationId');
  }

  Future<String?> getStoredAccessToken() async {
    return await secureStorageService.read('accessToken');
  }

  // Clear stored data
  Future<void> clearStoredData() async {
    await secureStorageService.clearAll();
  }
}
