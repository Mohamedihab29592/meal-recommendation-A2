import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';

abstract class SeeAllCubitState {}

class SeeAllInitial extends SeeAllCubitState {}

class SeeAllLoading extends SeeAllCubitState {}

class SeeAllLoaded extends SeeAllCubitState {
  final List<SeeAllModel> seeAllModels;

  SeeAllLoaded(this.seeAllModels);
}

class SeeAllError extends SeeAllCubitState {
  final String error;
  SeeAllError(this.error);
}
