import 'package:flutter/material.dart';
import 'package:food_restaurant_app/core/database/database_helper.dart';
import 'package:food_restaurant_app/core/di_container/di_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _initializeApp() async {
    await DatabaseHelper.initializeDatabase();
    initializeDiContainer();

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/restaurants');
  }

  @override
  void initState() {
    super.initState();

    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FlutterLogo(
            size: 180,
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
