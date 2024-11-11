class FavMeal {
  final String id;
  final String title;
  final String category;
  final int ingredients;
  final String time;
  final double rating;
  final String imageUrl;

  FavMeal({
    required this.id,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.time,
    required this.rating,
    required this.imageUrl,
  });

  factory FavMeal.fromMap(Map<String, dynamic> map) {
    return FavMeal(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      ingredients: map['ingredients'],
      time: map['time'],
      rating: map['rating'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'ingredients': ingredients,
      'time': time,
      'rating': rating,
      'imageUrl': imageUrl,
    };
  }
}
