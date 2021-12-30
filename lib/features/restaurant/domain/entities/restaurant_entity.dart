import 'package:equatable/equatable.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_hour_entity.dart';

class RestaurantEntity extends Equatable {
  final int id;
  final String name;
  final String address;
  final String image;
  final List<RestaurantHourEntity> hours;

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    this.hours = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
