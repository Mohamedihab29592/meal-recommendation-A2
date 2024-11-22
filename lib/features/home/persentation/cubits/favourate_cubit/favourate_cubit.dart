import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';

part 'favourate_state.dart';

class FavourateCubit extends Cubit<FavourateState> {
  FavourateCubit(this.mealService) : super(FavourateInitial());

  final MealService mealService;

  Future<void> changeFavourateStatus(String mealID) async {
    try {
      emit(FavourateLoading());
      Either<List<Meal>, FirebaseServerFailure> res = await mealService.modifyFavList(mealID);
      res.fold(
        (model) {
          return emit(FavourateSuccess(model));
        },
        (error) {
          return emit(FavourateFailed(error));
        },
      );
    } catch (e) {
      return emit(FavourateFailed(FirebaseServerFailure("Error, try again")));
    }
  }
}
