class SeeAllModel {
  String image;
  String mealName;
  int ingredientsCount;
  int time;
  bool isFavorite;
  double evaluation;

  SeeAllModel({
    required this.image,
    required this.mealName,
    required this.ingredientsCount,
    required this.time,
    this.isFavorite = false,
    this.evaluation = 0.0,
  });

  factory SeeAllModel.fromJson(Map<String, dynamic> json) {
    return SeeAllModel(
      image: json['meals'][0]['image'] ?? '',
      mealName: json['meals'][0]['name'] ?? '',
      ingredientsCount:
          (json['meals'][0]['ingrediantes'] as List<dynamic>?)?.length ?? 0,
      time: json['meals'][0]['duration'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
      evaluation: (json['evaluation'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
