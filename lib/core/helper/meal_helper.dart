class Ingredient {
  final String name;
  final int pieces;

  Ingredient({required this.name, required this.pieces});

  factory Ingredient.fromMap(Map<String, dynamic> data) {
    return Ingredient(
      name: data['name'] ?? '',
      pieces: data['pieces'] ?? 0,
    );
  }
}

class Meal {
  final String mealID;
  final String name;
  final int duration;
  final String image;
  final List<Ingredient> ingredients;
  final String subtitle;

  Meal({
    required this.mealID,
    required this.name,
    required this.duration,
    required this.image,
    required this.ingredients,
    required this.subtitle,
  });

  factory Meal.fromMap(Map<String, dynamic> data, String mealID) {
    return Meal(
      mealID: mealID,
      name: data['name'] ?? 'No name',
      duration: data['duration'] ?? 0,
      image: data['image'] ?? '',
      ingredients: (data['ingrediantes'] as List<dynamic>?)?.map((item) => Ingredient.fromMap(item as Map<String, dynamic>)).toList() ?? [],
      subtitle: data['subtitle'] ?? 'No subtitle',
    );
  }
}
