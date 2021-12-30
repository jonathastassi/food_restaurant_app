import 'package:flutter_test/flutter_test.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_hour_entity.dart';

void main() {
  group('RestaurantHourEntity', () {
    late RestaurantHourEntity restaurantHourEntity;

    test(
      'Should be created',
      () {
        restaurantHourEntity = const RestaurantHourEntity(
          days: [2, 3, 4],
          from: 'someFrom',
          to: 'someTo',
        );

        expect(restaurantHourEntity, isA<RestaurantHourEntity>());

        expect(restaurantHourEntity.days, [2, 3, 4]);
        expect(restaurantHourEntity.from, 'someFrom');
        expect(restaurantHourEntity.to, 'someTo');
      },
    );

    test(
      'Two instances with same data should be equal',
      () {
        const restaurantHourEntity = RestaurantHourEntity(
          days: [2, 3, 4],
          from: 'someFrom',
          to: 'someTo',
        );
        expect(restaurantHourEntity.props, [
          restaurantHourEntity.from,
          restaurantHourEntity.to,
          restaurantHourEntity.days,
        ]);

        expect(
          const RestaurantHourEntity(
            days: [2, 3, 4],
            from: 'someFrom',
            to: 'someTo',
          ),
          const RestaurantHourEntity(
            days: [2, 3, 4],
            from: 'someFrom',
            to: 'someTo',
          ),
        );
      },
    );
  });
}
