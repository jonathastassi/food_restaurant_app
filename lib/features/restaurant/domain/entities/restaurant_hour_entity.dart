import 'package:equatable/equatable.dart';

class RestaurantHourEntity extends Equatable {
  final String from;
  final String to;
  final List<int> days;

  const RestaurantHourEntity({
    required this.from,
    required this.to,
    required this.days,
  });

  @override
  List<Object?> get props => [
        from,
        to,
        days,
      ];
}
