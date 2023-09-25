import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

import 'cubits/weather_cubit/weather_states.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(),
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: cubit.getWeatherTheme(
              cubit.weatherModel?.weatherCondition,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        );
      },
    );
  }
}
