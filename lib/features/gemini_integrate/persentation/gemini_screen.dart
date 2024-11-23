import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/gemini_repo.dart';
import '../domain/gemini_chat_use_case.dart';
import 'geminiScreen_content.dart';
import 'gemini_cubit.dart';

class GeminiScreen extends StatelessWidget {
  const GeminiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GeminiRepository(),
      child: BlocProvider(
        create: (context) => ChatCubit(
          ChatUseCase(RepositoryProvider.of<GeminiRepository>(context)),
        ),
        child: const GeminiScreenContent(),
      ),
    );
  }
}
