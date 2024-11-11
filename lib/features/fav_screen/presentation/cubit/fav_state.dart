part of 'fav_cubit.dart';

abstract class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavLoaded extends FavState {
  final List<FavMeal> meals;

  const FavLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}

class FavError extends FavState {
  final String message;

  const FavError({required this.message});

  @override
  List<Object> get props => [message];
}
