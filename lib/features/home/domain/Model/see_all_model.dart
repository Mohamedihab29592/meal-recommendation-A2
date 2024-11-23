class SeeAllModel {
  String mealID;
  String image;
  String mealName;
  int ingredientsCount;
  int time;
  bool isFavorite;
  double evaluation;

  SeeAllModel({
    required this.mealID,
    required this.image,
    required this.mealName,
    required this.ingredientsCount,
    required this.time,
    required this.isFavorite,
    this.evaluation = 0.0,
  });

  factory SeeAllModel.fromJson(Map<String, dynamic> json, String mealID) {
    return SeeAllModel(
      mealID: mealID,
      image: json['image'] ?? '',
      mealName: json['name'] ?? '',
      ingredientsCount: (json['ingrediantes'] as List<dynamic>?)?.length ?? 0,
      time: json['duration'] ?? 0,
      isFavorite: json['isFav'] ?? false,
      evaluation: (json['evaluation'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
