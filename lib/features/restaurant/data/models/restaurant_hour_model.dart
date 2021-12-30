import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_hour_entity.dart';

class RestaurantHourModel extends RestaurantHourEntity {
  const RestaurantHourModel({
    required String from,
    required String to,
    required List<int> days,
  }) : super(
          from: from,
          to: to,
          days: days,
        );

  factory RestaurantHourModel.fromJson(Map<String, dynamic> json) {
    return RestaurantHourModel(
      from: json['from'],
      to: json['to'],
      days: json['days'] != null ? List.from(json['days']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['days'] = days;
    return data;
  }
}
