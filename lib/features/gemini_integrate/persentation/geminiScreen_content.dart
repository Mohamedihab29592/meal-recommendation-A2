import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utiles/app_colors.dart';
import '../../../core/utiles/app_router.dart';
import 'controller/gemini_chat_cubit.dart';
import 'controller/gemini_chat_states.dart';

class GeminiScreenContent extends StatefulWidget {
  const GeminiScreenContent({super.key});

  @override
  _GeminiScreenContentState createState() => _GeminiScreenContentState();
}

class _GeminiScreenContentState extends State<GeminiScreenContent> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  List<TextSpan> _formatMessage(String message) {
    final regex = RegExp(r'(\*\*|##)(.*?)\1');
    final matches = regex.allMatches(message);

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: message.substring(lastMatchEnd, match.start),
          style: const TextStyle(fontWeight: FontWeight.normal),
        ));
      }
      spans.add(TextSpan(
        text: match.group(2),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < message.length) {
      spans.add(TextSpan(
        text: message.substring(lastMatchEnd),
        style: const TextStyle(fontWeight: FontWeight.normal),
      ));
    }

    return spans;
  }

  Widget _buildMessage(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isUser ? Colors.blue[400] : Colors.green[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text.rich(
            TextSpan(children: _formatMessage(message)),
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini Chat',style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.c_001A3F,
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRouter.kHomeScreen),
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatStates>(
        builder: (context, state) {
          if (state is ChatStatesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatStatesSuccess) {
            _messages.add({'sender': 'Gemini', 'message': state.response});
          } else if (state is ChatStatesError) {
            _messages.add({'sender': 'Gemini', 'message': 'Error: ${state.error}'});
          }

          return Column(
            children: [
              Expanded(
                child: AnimatedList(
                  padding: const EdgeInsets.all(16.0),
                  initialItemCount: _messages.length,
                  itemBuilder: (context, index, animation) {
                    final message = _messages[index];
                    final isUser = message['sender'] == 'User';
                    return SlideTransition(
                      position: animation.drive(
                        Tween(
                          begin: const Offset(0, 0.1),
                          end: Offset.zero,
                        ).chain(CurveTween(curve: Curves.easeInOut)),
                      ),
                      child: _buildMessage(message['message'] ?? '', isUser),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, -2),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter your ingredients',
                          prefixIcon: const Icon(Icons.fastfood, color: Colors.grey),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: () {
                        final userInput = _controller.text.trim();
                        if (userInput.isNotEmpty) {
                          _messages.add({'sender': 'User', 'message': userInput});
                          context.read<ChatCubit>().sendMessage(userInput);
                          _controller.clear();
                        }
                      },
                      backgroundColor: Colors.indigo[500],
                      child: const Icon(Icons.send, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



