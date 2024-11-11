import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendations_a2/features/fav_screen/domain/model/FavModel.dart';
import 'package:meal_recommendations_a2/features/fav_screen/data/repo_imp.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final FavoriteService favoriteService = FavoriteService();

  FavCubit() : super(FavInitial());

  void loadFavorites() {
    emit(FavLoading());
    favoriteService.getFavoriteMeals().listen(
      (meals) => emit(FavLoaded(meals: meals)),
      onError: (error) => emit(const FavError(message: "Failed to load favorite meals")),
    );
  }
}
