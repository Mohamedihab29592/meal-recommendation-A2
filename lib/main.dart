import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/services/di.dart';
import 'core/utiles/app_router.dart';
import 'features/auth/otp/presentation/otp_verification_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup(); //get it
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
