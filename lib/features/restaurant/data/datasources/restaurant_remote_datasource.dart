import 'package:food_restaurant_app/core/errors/exceptions.dart';
import 'package:food_restaurant_app/core/network/http_client.dart';
import 'package:food_restaurant_app/features/restaurant/data/models/restaurant_model.dart';

abstract class RestaurantRemoteDatasource {
  Future<List<RestaurantModel>> getAllRestaurants();
}

class RestaurantRemoteDatasourceImpl implements RestaurantRemoteDatasource {
  late final HttpClient _httpClient;

  RestaurantRemoteDatasourceImpl({
    required HttpClient httpClient,
  }) {
    _httpClient = httpClient;
  }

  @override
  Future<List<RestaurantModel>> getAllRestaurants() async {
    try {
      final response =
          await _httpClient.get('https://challange.goomer.com.br/restaurants');

      if (response.statusCode == 200) {
        final listRestaurants = response.data;
        if (listRestaurants == null || listRestaurants.isEmpty) {
          return [];
        }

        return List.from(response.data)
            .map((restaurant) => RestaurantModel.fromJson(restaurant))
            .toList();
      }

      throw ServerException();
    } catch (_) {
      throw ServerException();
    }
  }
}
