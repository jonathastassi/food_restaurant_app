import 'package:food_restaurant_app/core/errors/exceptions.dart';
import 'package:food_restaurant_app/features/restaurant/data/datasources/restaurant_local_datasource.dart';
import 'package:food_restaurant_app/features/restaurant/data/datasources/restaurant_remote_datasource.dart';
import 'package:food_restaurant_app/features/restaurant/data/models/restaurant_model.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_entity.dart';
import 'package:food_restaurant_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:food_restaurant_app/features/restaurant/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantLocalDatasource restaurantLocalDatasource;
  final RestaurantRemoteDatasource restaurantRemoteDatasource;

  RestaurantRepositoryImpl({
    required this.restaurantLocalDatasource,
    required this.restaurantRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<RestaurantEntity>>> getAllRestaurants() async {
    if (1 == 1) {
      try {
        final List<RestaurantModel> restaurants =
            await restaurantRemoteDatasource.getAllRestaurants();
        restaurantLocalDatasource.cacheRestaurants(restaurants);

        return Right(restaurants);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<RestaurantModel> restaurants =
            await restaurantLocalDatasource.getLastRestaurants();

        return Right(restaurants);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
