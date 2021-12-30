import 'package:flutter_test/flutter_test.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_entity.dart';

void main() {
  group('RestaurantEntity', () {
    late RestaurantEntity restaurantEntity;

    test(
      'Should be created',
      () {
        restaurantEntity = const RestaurantEntity(
          id: 100,
          name: 'someName',
          image: 'someImage',
          address: 'someAddress',
        );

        expect(restaurantEntity, isA<RestaurantEntity>());

        expect(restaurantEntity.id, 100);
        expect(restaurantEntity.name, 'someName');
        expect(restaurantEntity.image, 'someImage');
        expect(restaurantEntity.address, 'someAddress');
        expect(restaurantEntity.hours, []);
      },
    );

    test(
      'Two instances with same data should be equal',
      () {
        const restaurantEntity = RestaurantEntity(
          id: 100,
          name: 'someName',
          image: 'someImage',
          address: 'someAddress',
        );
        expect(restaurantEntity.props, [
          restaurantEntity.id,
          restaurantEntity.name,
        ]);

        expect(
          const RestaurantEntity(
            id: 100,
            name: 'someName',
            image: 'someImage',
            address: 'someAddress',
          ),
          const RestaurantEntity(
            id: 100,
            name: 'someName',
            image: 'someImage',
            address: 'someAddress',
          ),
        );
      },
    );
  });
}
