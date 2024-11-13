import 'package:flutter_gemini/flutter_gemini.dart';

class ChatUseCase {
  final Gemini _gemini;

  ChatUseCase(this._gemini);

  Future<String> getMealRecommendation(String ingredients) async {
    final request = "Recommend a meal based on these ingredients: $ingredients. "
        "Your role is Nutrition Assistant only, not else. Include steps and nutrition facts.";
    final response = await _gemini.text(request);
    return response?.output ?? 'No response';
  }
}
