import 'package:flutter_test/flutter_test.dart';
import 'package:food_restaurant_app/core/errors/failures.dart';

void main() {
  group('Failure', () {
    test('Validate props', () {
      final failure = ServerFailure();

      expect(failure.props, []);
    });

    test('ServerFailure should be a failure', () {
      expect(ServerFailure(), isA<Failure>());
    });

    test('CacheFailure should be a failure', () {
      expect(CacheFailure(), isA<Failure>());
    });

    test('NoConnectionFailure should be a failure', () {
      expect(NoConnectionFailure(), isA<Failure>());
    });
  });
}
