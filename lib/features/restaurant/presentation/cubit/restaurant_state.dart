part of 'restaurant_cubit.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class EmptyState extends RestaurantState {}

class LoadingState extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<RestaurantEntity> restaurants;

  const RestaurantLoaded(this.restaurants);
}

class ErrorState extends RestaurantState {
  final String message;

  const ErrorState(this.message);
}
