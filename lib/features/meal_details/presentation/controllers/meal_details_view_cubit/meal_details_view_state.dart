part of 'meal_details_view_cubit.dart';

sealed class MealDetailsViewState extends Equatable {
  const MealDetailsViewState();

  @override
  List<Object> get props => [];
}

final class MealDetailsViewInitial extends MealDetailsViewState {}

final class MealDetailsViewLoading extends MealDetailsViewState {}

final class MealDetailsModelReceived extends MealDetailsViewState {
  const MealDetailsModelReceived(this.model);

  final MealDetailsModel model;
}

final class MealDetailsViewFailed extends MealDetailsViewState {
  const MealDetailsViewFailed(this.error);

  final FirebaseServerFailure error;
}
