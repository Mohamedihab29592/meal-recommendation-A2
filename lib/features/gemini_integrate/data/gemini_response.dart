class MealRecommendationResponse {
  final String? output;

  MealRecommendationResponse({required this.output});

  factory MealRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return MealRecommendationResponse(output: json['output'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'output': output};
  }
}
