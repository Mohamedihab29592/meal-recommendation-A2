import 'package:meal_recommendations_a2/features/fav_screen/data/repo_imp.dart';
import 'package:meal_recommendations_a2/features/fav_screen/domain/model/FavModel.dart';

class FetchFavoriteMealsUseCase {
  final FavoriteService favoriteService;

  FetchFavoriteMealsUseCase(this.favoriteService);

  Stream<List<FavMeal>> call() {
    return favoriteService.getFavoriteMeals();
  }
}
