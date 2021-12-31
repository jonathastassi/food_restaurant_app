import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_restaurant_app/core/usecases/usecase.dart';
import 'package:food_restaurant_app/features/restaurant/domain/entities/restaurant_entity.dart';
import 'package:food_restaurant_app/features/restaurant/domain/usecases/get_restaurant_list_usecase.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final GetRestaurantListUsecase getRestaurantListUsecase;

  RestaurantCubit({
    required this.getRestaurantListUsecase,
  }) : super(RestaurantInitial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    emit(LoadingState());

    final result = await getRestaurantListUsecase.call(NoParams());

    result.fold(
      (error) => emit(
        ErrorState(
          error.toString(),
        ),
      ),
      (data) {
        if (data.isEmpty) {
          emit(EmptyState());
        } else {
          emit(RestaurantLoaded(data));
        }
      },
    );
  }
}
