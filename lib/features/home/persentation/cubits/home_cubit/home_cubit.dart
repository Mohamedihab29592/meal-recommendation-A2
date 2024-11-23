import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.mealService) : super(HomeInitial());

  final MealService mealService;

  Future<void> changeFavourateStatus(String mealID) async {
    try {
      emit(HomeLoading());
      Either<List<Meal>, FirebaseServerFailure> res = await mealService.changeFavourateStatus(mealID);
      res.fold(
        (model) {
          return emit(HomeSuccess(model));
        },
        (error) {
          return emit(HomeFailed(error));
        },
      );
    } catch (e) {
      return emit(HomeFailed(FirebaseServerFailure("Error, try again")));
    }
  }
}
