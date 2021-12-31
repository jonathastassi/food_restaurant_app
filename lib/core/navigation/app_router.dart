import 'package:flutter/material.dart';
import 'package:food_restaurant_app/features/restaurant/presentation/pages/restaurant_list_page.dart';
import 'package:food_restaurant_app/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/restaurants':
        return MaterialPageRoute(builder: (_) => const RestaurantListPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
