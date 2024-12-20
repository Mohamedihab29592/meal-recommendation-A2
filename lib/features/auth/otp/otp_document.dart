// ignore: dangling_library_doc_comments
/// # OTP Verification Feature
/// 
/// This feature allows phone number verification using an OTP (One-Time Password) 
/// in a Flutter app. Users enter the OTP sent to their phone to verify their number.

/// ## File Structure
/// 
/// - **`OtpVerificationScreen`**: The main UI screen for OTP entry.
/// - **`OTPCubit`**: Manages OTP actions like sending and verifying the OTP.
/// - **`OTPRepositoryImpl`**: Connects with Firebase to send and verify the OTP.
/// - **Use Cases**:
///   - **`send_otp.dart`**: Handles OTP sending.
///   - **`verify_otp_usecase.dart`**: Handles OTP verification.

/// ## Components and Flow

/// ### `OtpVerificationScreen`
/// - **UI**: Displays a text field for entering the OTP.
/// - **Cubit**: Initializes `OTPCubit` to handle OTP sending and verification.
/// - **State Management**: Listens for state changes such as loading, success, and error.

/// ### `OTPCubit`
/// - **Functionality**: 
///   - `sendOTP`: Sends an OTP to the specified phone number.
///   - `verifyOTP`: Verifies the OTP entered by the user.
/// - **States**:
///   - `OTPLoading`: Indicates loading during OTP sending or verification.
///   - `OTPCodeSent`: OTP sent successfully.
///   - `OTPVerified`: OTP successfully verified.
///   - `OTPError`: Shows an error if sending or verifying fails.

/// ### `OTPRepositoryImpl`
/// - **Integration**: Uses Firebase for OTP operations.
/// - **Methods**:
///   - `sendOTP`: Triggers OTP sending to the provided phone number.
///   - `verifyOTP`: Confirms OTP with Firebase using the provided verification ID and OTP.

/// ## Dependencies
/// 
/// Add these dependencies to `pubspec.yaml`:
/// ```yaml
/// dependencies:
///   flutter:
///   flutter_bloc:
///   get_it:
///   pin_code_fields:
///   firebase_auth:
/// ```

/// ## Usage
/// 
/// To launch the OTP verification screen, navigate to it with the user’s phone number:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => OtpVerificationScreen(phoneNumber: '+123456789'),
///   ),
/// );
/// ```

// ignore_for_file: dangling_library_doc_comments

/// ## Firebase Setup
/// 
/// Ensure Firebase is properly configured in your app for phone authentication.
