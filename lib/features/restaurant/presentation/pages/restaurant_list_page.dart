import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_restaurant_app/core/di_container/di_container.dart';
import 'package:food_restaurant_app/features/restaurant/presentation/cubit/restaurant_cubit.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<RestaurantCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Bem-vindo ao Lista Rango',
                  style: TextStyle(
                    fontSize: 29,
                    color: Color(0XFF404040),
                    letterSpacing: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<RestaurantCubit, RestaurantState>(
                listener: (context, state) {
                  print(state);
                },
                builder: (context, state) {
                  if (state is ErrorState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.mood_bad,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Ocorreu um erro ao carregar as informações!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.read<RestaurantCubit>().fetchData(),
                          child: const Text(
                            'Tentar novamente',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  if (state is RestaurantLoaded) {
                    return Container(
                      height: 700,
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            state.restaurants[index].name,
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                        itemCount: state.restaurants.length,
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
