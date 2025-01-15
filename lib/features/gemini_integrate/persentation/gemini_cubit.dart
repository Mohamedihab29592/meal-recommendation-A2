import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/gemini_chat_use_case.dart';
import 'gemini_states.dart';

class ChatStatesError extends ChatStates {
  final String error;

  ChatStatesError(this.error);
}

class ChatCubit extends Cubit<ChatStates> {
  final ChatUseCase _chatUseCase;

  ChatCubit(this._chatUseCase) : super(ChatStatesInit());

  Future<void> sendMessage(String ingredients) async {
    emit(ChatStatesLoading());
    try {
      final response = await _chatUseCase.getMealRecommendation(ingredients);
      emit(ChatStatesSuccess(response));
    } catch (e) {
      emit(ChatStatesError(e.toString()));
    }
  }
}
