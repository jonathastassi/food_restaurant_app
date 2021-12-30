import 'package:food_restaurant_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:food_restaurant_app/core/usecases/usecase.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_entity.dart';
import 'package:food_restaurant_app/features/restaurant/domain/repositories/restaurant_repository.dart';

class GetRestaurantListUsecase
    implements Usecase<List<RestaurantEntity>, NoParams> {
  late final RestaurantRepository _restaurantRepository;

  GetRestaurantListUsecase({
    required RestaurantRepository restaurantRepository,
  }) {
    _restaurantRepository = restaurantRepository;
  }

  @override
  Future<Either<Failure, List<RestaurantEntity>>> call(NoParams params) {
    return _restaurantRepository.getAllRestaurants();
  }
}
