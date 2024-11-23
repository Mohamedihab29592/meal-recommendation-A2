class MealDetailsModel {
  final String id;
  final String name;
  final String subtitle;
  final Duration duration;
  final int serving;
  final String summary;
  final Nutritions nutritions;
  final List<Ingrediantes> ingrediantes;
  final List<String> steps;
  final String image;
  final bool isFav;

  const MealDetailsModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.duration,
    required this.serving,
    required this.summary,
    required this.nutritions,
    required this.ingrediantes,
    required this.steps,
    required this.image,
    required this.isFav,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subtitle': subtitle,
      'duration': duration.inMinutes,
      'serving': serving,
      'summary': summary,
      'nutritions': nutritions.toJson(),
      'ingrediantes': ingrediantes.map((ingrediente) => ingrediente.toJson()).toList(),
      'steps': steps,
      'image': image,
      'isFav': isFav,
    };
  }

  factory MealDetailsModel.fromJson(dynamic json, String id) {
    return MealDetailsModel(
      id: id,
      name: json['name'],
      subtitle: json['subtitle'],
      duration: Duration(minutes: json['duration']),
      serving: json['serving'],
      summary: json['summary'],
      nutritions: Nutritions.fromJson(json['nutritions']),
      ingrediantes: json['ingrediantes'].map<Ingrediantes>((ingrediente) => Ingrediantes.fromJson(ingrediente)).toList(),
      steps: json['steps'].map<String>((step) => step.toString()).toList(),
      image: json['image'],
      isFav: json['isFav'],
    );
  }

  factory MealDetailsModel.init() {
    return const MealDetailsModel(
      id: "",
      name: "",
      subtitle: "",
      duration: Duration(),
      serving: 0,
      summary: "",
      nutritions: Nutritions(carp: 0, fat: 0, kcal: 0, protein: 0, vitamenes: 0),
      ingrediantes: [],
      steps: [],
      image: "",
      isFav: false,
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
      protein: double.parse(json['protein'].toString()),
      carp: double.parse(json['carp'].toString()),
      fat: double.parse(json['fat'].toString()),
      kcal: double.parse(json['kcal'].toString()),
      vitamenes: double.parse(json['vitamenes'].toString()),
    );
  }

  factory Nutritions.init() {
    return const Nutritions(protein: 0, carp: 0, fat: 0, kcal: 0, vitamenes: 0);
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

  factory Ingrediantes.init(dynamic json) {
    return const Ingrediantes(name: "", pieces: 0);
  }
}
