import '../data/gemini_repo.dart';
import '../data/gemini_response.dart';

class ChatUseCase {
  final GeminiRepository _repository;

  ChatUseCase(this._repository);

  Future<MealRecommendationResponse> getMealRecommendation(String ingredients) async {
    final request = "Recommend a meal based on these ingredients: $ingredients. "
        "Your role is Nutrition Assistant only, not else. Include steps and nutrition facts.";
    return await _repository.getMealRecommendation(request);
  }
}
