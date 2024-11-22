part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  const HomeSuccess(this.meals);

  final List<Meal> meals;
}

final class HomeFailed extends HomeState {
  const HomeFailed(this.error);

  final FirebaseServerFailure error;
}
