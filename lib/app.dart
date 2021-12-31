import 'package:flutter/material.dart';
import 'package:food_restaurant_app/core/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 62,
          backgroundColor: Color(0XFF009CA3),
        ),
      ),
      onGenerateRoute: AppRouter.onGeneratedRoutes,
    );
  }
}
