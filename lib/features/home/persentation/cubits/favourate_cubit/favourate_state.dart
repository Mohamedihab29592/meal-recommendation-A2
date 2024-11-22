part of 'favourate_cubit.dart';

sealed class FavourateState extends Equatable {
  const FavourateState();

  @override
  List<Object> get props => [];
}

final class FavourateInitial extends FavourateState {}

final class FavourateLoading extends FavourateState {}

final class FavourateSuccess extends FavourateState {
  const FavourateSuccess(this.meals);

  final List<Meal> meals;
}

final class FavourateFailed extends FavourateState {
  const FavourateFailed(this.error);

  final FirebaseServerFailure error;
}
