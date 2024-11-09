import 'package:meal_recommendations_a2/features/fav_screen/domain/model/FavModel.dart';

abstract class FavoriteDataSource {
  Stream<List<FavMeal>> getFavoriteMeals(); 
}
