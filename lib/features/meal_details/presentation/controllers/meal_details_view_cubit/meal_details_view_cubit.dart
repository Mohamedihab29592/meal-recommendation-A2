import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';
import 'package:meal_recommendations_a2/features/meal_details/domain/repo_interface/meal_details_repo.dart';

part 'meal_details_view_state.dart';

class MealDetailsViewCubit extends Cubit<MealDetailsViewState> {
  MealDetailsViewCubit(this.mealDetailsRepo) : super(MealDetailsViewInitial());

  final MealDetailsRepo mealDetailsRepo;

  Future<void> getMealDetailsModel(String mealID) async {
    try {
      emit(MealDetailsViewLoading());
      Either<MealDetailsModel, FirebaseServerFailure> res = await mealDetailsRepo.getMealDetailsModel(mealID);
      res.fold(
        (model) {
          return emit(MealDetailsModelReceived(model));
        },
        (error) {
          return emit(MealDetailsViewFailed(error));
        },
      );
    } catch (e) {
      return emit(MealDetailsViewFailed(FirebaseServerFailure("Error, try again")));
    }
  }

  Future<void> changeFavourateStatus(String mealID) async {
    try {
      emit(MealDetailsViewLoading());
      Either<MealDetailsModel, FirebaseServerFailure> res = await mealDetailsRepo.changeFavourateStatus(mealID);
      res.fold(
        (model) {
          return emit(MealDetailsModelReceived(model));
        },
        (error) {
          return emit(MealDetailsViewFailed(error));
        },
      );
    } catch (e) {
      return emit(MealDetailsViewFailed(FirebaseServerFailure("Error, try again")));
    }
  }
}
