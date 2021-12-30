import 'package:food_restaurant_app/core/database/local_database.dart';
import 'package:food_restaurant_app/core/errors/exceptions.dart';
import 'package:food_restaurant_app/features/restaurant/data/models/restaurant_model.dart';

abstract class RestaurantLocalDatasource {
  Future<List<RestaurantModel>> getLastRestaurants();
  Future<void> cacheRestaurants(List<RestaurantModel> restaurants);
}

class RestaurantLocalDatasourceImpl implements RestaurantLocalDatasource {
  final String tableName = 'RESTAURANTS';

  late final LocalDatabase _localDatabase;

  RestaurantLocalDatasourceImpl({required LocalDatabase localDatabase}) {
    _localDatabase = localDatabase;
  }

  @override
  Future<List<RestaurantModel>> getLastRestaurants() async {
    try {
      final restaurantsMap = await _localDatabase.getAll(tableName);

      final List<RestaurantModel> restaurants = restaurantsMap
          .map((restaurantMap) => RestaurantModel.fromJson(restaurantMap))
          .toList();
          
      return restaurants;
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheRestaurants(List<RestaurantModel> restaurants) async {
    try {
      await _localDatabase.deleteAll(tableName);

      await _localDatabase.insertMany(tableName,
          restaurants.map((restaurant) => restaurant.toJson()).toList());
    } catch (_) {
      throw CacheException();
    }
  }
}
