class MealDetailsModel {
  final String mealName;
  final String subtitle;
  final Duration duration;
  final int serving;
  final String summary;
  final Nutritions nutritions;
  final List<Ingrediantes> ingrediantes;
  final List<String> steps;
  final String mealImagePath;

  const MealDetailsModel({
    required this.mealName,
    required this.subtitle,
    required this.duration,
    required this.serving,
    required this.summary,
    required this.nutritions,
    required this.ingrediantes,
    required this.steps,
    required this.mealImagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'meal name': mealName,
      'subtitle': subtitle,
      'duration': duration.inMinutes,
      'serving': serving,
      'summary': summary,
      'nutritions': nutritions.toJson(),
      'ingrediantes': ingrediantes.map((ingrediente) => ingrediente.toJson()).toList(),
      'steps': steps,
      'meal image': mealImagePath,
    };
  }

  factory MealDetailsModel.fromJson(dynamic json) {
    return MealDetailsModel(
      mealName: json['meal name'],
      subtitle: json['subtitle'],
      duration: Duration(minutes: json['duration']),
      serving: json['serving'],
      summary: json['summary'],
      nutritions: Nutritions.fromJson(json['nutritions']),
      ingrediantes: json['ingrediantes'].map((ingrediente) => Ingrediantes.fromJson(ingrediente)).toList(),
      steps: json['steps'],
      mealImagePath: json['meal image'],
    );
  }
}

class Nutritions {
  final double protein;
  final double carp;
  final double fat;
  final double kcal;
  final double vitamenes;

  const Nutritions({
    required this.protein,
    required this.carp,
    required this.fat,
    required this.kcal,
    required this.vitamenes,
  });

  Map<String, dynamic> toJson() {
    return {
      'protein': protein,
      'carp': carp,
      'fat': fat,
      'kcal': kcal,
      'vitamenes': vitamenes,
    };
  }

  factory Nutritions.fromJson(dynamic json) {
    return Nutritions(
      protein: json['protein'],
      carp: json['carp'],
      fat: json['fat'],
      kcal: json['kcal'],
      vitamenes: json['vitamenes'],
    );
  }
}

class Ingrediantes {
  final String name;
  final int pieces;

  const Ingrediantes({
    required this.name,
    required this.pieces,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pieces': pieces,
    };
  }

  factory Ingrediantes.fromJson(dynamic json) {
    return Ingrediantes(
      name: json['name'],
      pieces: json['pieces'],
    );
  }
}
