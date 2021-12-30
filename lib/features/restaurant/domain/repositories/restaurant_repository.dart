import 'package:dartz/dartz.dart';
import 'package:food_restaurant_app/core/errors/failures.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_entity.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<RestaurantEntity>>> getAllRestaurants();
}
