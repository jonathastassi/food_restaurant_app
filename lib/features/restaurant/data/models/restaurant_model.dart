import 'package:food_restaurant_app/features/restaurant/data/models/restaurant_hour_model.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  const RestaurantModel({
    required int id,
    required String name,
    required String image,
    required String address,
    List<RestaurantHourModel> hours = const [],
  }) : super(
          id: id,
          name: name,
          image: image,
          address: address,
          hours: hours,
        );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      address: json['address'],
      hours: json['hours'] != null
          ? List.from(
              json['hours'].map((hour) => RestaurantHourModel.fromJson(hour)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['hours'] = null;
    data['image'] = image;
    return data;
  }
}
