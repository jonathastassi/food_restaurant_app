import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_restaurant_app/core/usecases/usecase.dart';
import 'package:food_restaurant_app/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:food_restaurant_app/features/restaurant/domain/usecases/get_restaurant_list_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  group('GetRestaurantListUsecase', () {
    late RestaurantRepository mockRestaurantRepository;
    late GetRestaurantListUsecase getRestaurantListUsecase;

    setUp(() {
      mockRestaurantRepository = MockRestaurantRepository();
      getRestaurantListUsecase = GetRestaurantListUsecase(
        restaurantRepository: mockRestaurantRepository,
      );
    });

    test('Should call getAllRestaurants from RestaurantRepository', () {
      when(() => mockRestaurantRepository.getAllRestaurants())
          .thenAnswer((_) async => const Right([]));

      getRestaurantListUsecase.call(NoParams());

      verify(() => mockRestaurantRepository.getAllRestaurants()).called(1);
    });
  });
}
