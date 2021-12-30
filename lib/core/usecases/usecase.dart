import 'package:dartz/dartz.dart';
import 'package:food_restaurant_app/core/errors/failures.dart';

abstract class Usecase<TOut, TIn> {
  Future<Either<Failure,TOut>> call(TIn params);
}

class NoParams {}
