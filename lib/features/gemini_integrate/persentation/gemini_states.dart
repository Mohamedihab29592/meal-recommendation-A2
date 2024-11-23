import '../data/gemini_response.dart';

abstract class ChatStates {}

class ChatStatesInit extends ChatStates {}

class ChatStatesLoading extends ChatStates {}

class ChatStatesSuccess extends ChatStates {
  final MealRecommendationResponse response;

  ChatStatesSuccess(this.response);
}
