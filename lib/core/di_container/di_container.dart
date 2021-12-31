import 'package:dio/dio.dart';
import 'package:food_restaurant_app/core/database/database_helper.dart';
import 'package:food_restaurant_app/core/database/local_database.dart';
import 'package:food_restaurant_app/core/network/http_client.dart';
import 'package:food_restaurant_app/features/restaurant/data/datasources/restaurant_local_datasource.dart';
import 'package:food_restaurant_app/features/restaurant/data/datasources/restaurant_remote_datasource.dart';
import 'package:food_restaurant_app/features/restaurant/data/repositories/restaurant_repository_impl.dart';
import 'package:food_restaurant_app/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:food_restaurant_app/features/restaurant/domain/usecases/get_restaurant_list_usecase.dart';
import 'package:food_restaurant_app/features/restaurant/presentation/cubit/restaurant_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDiContainer() async {
  // Core
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );
  sl.registerLazySingleton<HttpClient>(
    () => HttpClientImpl(dio: sl()),
  );
  sl.registerLazySingleton<LocalDatabase>(
    () => LocalDatabaseImpl(database: DatabaseHelper.instance.database!),
  );

  // Datasources
  sl.registerLazySingleton<RestaurantRemoteDatasource>(
    () => RestaurantRemoteDatasourceImpl(httpClient: sl()),
  );
  sl.registerLazySingleton<RestaurantLocalDatasource>(
    () => RestaurantLocalDatasourceImpl(localDatabase: sl()),
  );

  // Repositories
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      restaurantLocalDatasource: sl(),
      restaurantRemoteDatasource: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton<GetRestaurantListUsecase>(
    () => GetRestaurantListUsecase(restaurantRepository: sl()),
  );

  // Blocs/Cubits
  sl.registerFactory<RestaurantCubit>(
    () => RestaurantCubit(getRestaurantListUsecase: sl()),
  );
}
